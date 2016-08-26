# -*- coding: utf8 -*-
from subprocess import Popen, PIPE
import sys, time, os, re, fileinput, csv, openpyxl
from openpyxl import load_workbook, Workbook
from openpyxl.cell import get_column_letter
from configfilecreo import configfilecreator
from parser import initialize_stat

def packet_and_case_chooser(resultOfPortchooser, test_case, TypeChoice, type, LogResultDir):
    if test_case == "Standart" or test_case == "Reg" or test_case == "25":
        Title = 'MaxThroughput'
        Template = '%s_Template_Throughput.txt' % (TypeChoice)

    elif test_case == "1" or test_case == "16" or test_case == "100":
        Title = 'ConcurrentConnections'                                               #Функция запуска теста "Конкурентные соединения", принимает строку
        Template = '%s_Template_Concurent.txt' % (TypeChoice)                           #с номерами и типами портов, кейс (1, 16, 100 соединений), тип DUT,
    TestPathResult = "%s\\\%s\\\%s" % (TypeChoice, Title, test_case)            #тип тестового устройства формирует шаблон для формирования конфига,
    RepCardIdClient = '1'                                                         #формирует путь к логам и строки с пакетами в зависимоти от устройства
    RepCardIdServer = '2'                                                         #строка с выбрнными портами парсится, фреймы в циклах ниже по очереди идут на вход
    numport = 0                                                                  # к сборщику конфига, прибавляя 40 байт если КШ и 58 если КК
    for res in resultOfPortchooser.split():
        if numport == 0:
            RepPortIdClient = res
        if numport == 1:
            RepPortIdServer = res
        if numport == 2:
            RepPortType = res
        numport += 1
    FrameList = frame_creator(type, TypeChoice)
    for test_frame in FrameList:
        if test_frame == 1460 or TypeChoice == "L2" and test_frame != 1390:
            frame_concat = 58
        elif test_frame == 1408:
            frame_concat = -8
        elif test_frame == 1390:
            frame_concat = 10
        else:
            frame_concat = 40
        RepFrameResult = str(test_frame)
        RepLogName = str(test_frame + frame_concat)
        configfilecreator(RepPortIdClient, RepPortIdServer, RepCardIdClient, RepCardIdServer, RepPortType,
                              TestPathResult, RepFrameResult, RepLogName, Title, Template, test_case, LogResultDir)

def frame_creator(type, TypeChoice):

    if type == "short":
        CGW_Frames = [216, 1240, 1460]
        L2_Frames = [198, 1222, 1460]
    elif type == "long":
        if TypeChoice == "CGW_MCE":
            CGW_Frames = [216, 472, 984, 1240, 1460]
        if TypeChoice == "L3":
            CGW_Frames = [216, 472, 984, 1240, 1460, 1408]
        if TypeChoice == "L2":
            L2_Frames = [198, 454, 966, 1222, 1460, 1390]
    if TypeChoice == "CGW_MCE" or TypeChoice == "L3":
        FrameList = CGW_Frames
    elif TypeChoice == "L2":
        FrameList = L2_Frames
    return FrameList

def PlatformChooser():
    num_of_platform = input(
        "Введите тип платформы: IPC-"
        )
    return num_of_platform

def througput_and_cc_run(TypeChoice, type):
    num_of_platform = PlatformChooser()
    LogResultDir = r'C:\\%s\\Result\\TCP' % (num_of_platform)
    resultOfPortchooser = port_chooser(TypeChoice)                            #здесь вызов функции выбора портов
    resultOfPortchooser = " ".join(resultOfPortchooser)
    for test_step in range(1,4):                                                        #Тест запускается трижды -

        if test_step == 1:
            userinput = input("Включите регистрацию пакетов на DUT и нажмите Enter, введите 'N' чтобы пропустить тест\n ")
            if userinput == 'N' or userinput == 'n':
                continue
            else:
                testcase = "Reg"                                                        #1) с включенной регистрацией, давая выбор юзеру
                packet_and_case_chooser(resultOfPortchooser, testcase, TypeChoice, type, LogResultDir)#запуск функции с строкой содержащей номера и тип портов +
                print("Выполняется тест с включенной регистрацией пакетов\n ")          #название кейса для папки с результатами и тип теста - длиный или короткий

        if test_step == 2 and TypeChoice != "L2":
            userinput = input("Выключите регистрацию пакетов, выставите 25 ПФ и нажмите Enter, введите 'N' чтобы пропустить тест\n ")
            if userinput == 'N' or userinput == 'n':
                continue                                                                #2) с 25ю ПФ
            else:
                testcase = "25"
                print("Выполняется тест с 25 ПФ\n ")
                packet_and_case_chooser(resultOfPortchooser, testcase, TypeChoice, type, LogResultDir)

        if test_step == 3:
            if TypeChoice == "L3" or TypeChoice == "CGW_MCE":
                userinput = input("Удалите 25 ПФ и нажмите Enter, введите 'N' чтобы пропустить тест\n ")
                if userinput == 'N' or userinput == 'n':
                    continue
                else:
                    testcase = "Standart"
                    print("Выполняется тест с выключенной регистрацией пакетов\n ")             #3) с выключенной регистрацией -
                    packet_and_case_chooser(resultOfPortchooser, testcase, TypeChoice, type, LogResultDir)

            elif TypeChoice == "L2":
                userinput = input("Выключите регистрацию пакетов и нажмите Enter, введите 'N' чтобы пропустить тест\n ")
                if userinput == 'N' or userinput == 'n':
                    continue
                else:
                    testcase = "Standart"
                    print("Выполняется тест с выключенной регистрацией пакетов\n ")             #3) с выключенной регистрацией -
                    packet_and_case_chooser(resultOfPortchooser, testcase, TypeChoice, type, LogResultDir)

    for CC in range(1,4):                                                               #запуск теста с конкурентными сессиями
        if CC == 1:
            testcase = "1"
            print("Выполняется тест на 1й сессии\n ")
            packet_and_case_chooser(resultOfPortchooser, testcase, TypeChoice, type, LogResultDir)
        if CC == 2:
            testcase = "16"
            print("Выполняется тест на 16ти сессиях\n ")
            packet_and_case_chooser(resultOfPortchooser, testcase, TypeChoice, type, LogResultDir)
        if CC == 3:
            testcase = "100"
            print("Выполняется тест на 100 сессиях\n ")
            packet_and_case_chooser(resultOfPortchooser, testcase, TypeChoice, type, LogResultDir)
    print("\n***************************************\n")
    print("Тесты закончены")
    print("\n***************************************\n")
    ParsLogResultDir = re.sub(r"\\", LogResultDir, '\\')
    ResultOfStat = initialize_stat(ParsLogResultDir, num_of_platform)
    for element in ResultOfStat:
        if element == ResultOfStat[0]:
            print("\nРезультаты собраны в файл " + element)
        if element == ResultOfStat[1]:
            if element > 0:
                print ("\n!!!!!!!!!!!!!!\nWARNING\n!!!!!!!!!!!!!!\n")
                print ("В тесте обнаружено", element, "нулевых значений")
                print ("Просмотрите лог выше, в тестах с пометкой Fail возможны просадки")

def port_chooser(TypeChoice):

    print ("Выберите порты Ixia которые скоммутированы с вашим DUT")
    print("Внимание порты не должны использоваться в каком-либо другом тесте, они должны быть очищены в IxNetwork")
    if TypeChoice == "CGW_MCE":
        port = "154.1.1.2"
        port2 = "39.3.3.2"
    elif TypeChoice == "L3":
        port = "154.1.1.2"
        port2 = "134.1.1.2"
    elif TypeChoice == "L2":
        port = "1.1.1.2"
        port2 = "1.1.1.1"
    port_of_card1 = input(
         "Введите номер порта (IP %s) из Шасси 1 - нижняя от 1 до 12: " % (port)                         #функция выбора портов. всегда идет за главным меню, возвращает
        )
                                                                                  #cтроку с номерами и типами портов, спрашивая о них юзера и не давая ввести порты после №12
    port_of_card2 = input(
        "Введите номер порта (IP %s) из Шасси 2 - верхняя от 1 до 12: " % (port2)
        )
    user_choose_port = input ("По умолчанию выбран тип порта - медь, нажмите Enter чтобы продолжить, для выбора оптики введите F ")
    if user_choose_port == "F" or user_choose_port == "f":
        type_port = "fiber"
    else:
        type_port = "copper"

    if int(port_of_card1) in range(1,13) and int (port_of_card2) in range(1,13):
        print ("\n\n тип порта " + type_port + "\n" + " порт на 1ом шасси - " + port_of_card1 + ", IP - " + port
                + "\n" + " порт на 2м шасси - " + port_of_card2 + ", IP - " + port2 + "\n")
        user_confirm = input ("Enter чтобы продолжить, N - возврат к выбору портов")
        if user_confirm == "n" or user_confirm == "N":
            port_chooser(TypeChoice)
        else:
            return port_of_card1, port_of_card2, type_port

    else:
        print ("\n" + "Некорректный номер порта, введите число от 1 до 12")
        port_chooser(TypeChoice)


def main_menu():
    print ("\n===== Измерение производительности TCP v. 1.1 ====\n")
    try:
        main_input = int(input(
            "Введите номер теста:\n"
            "1: Полный тест L3\n"
            "2: Полный тест МСЭ\n"
            "3: Полный тест КК\n"
            "4: Сокращенный тест L3 (256, 1280, 1518)\n"
            "5: Сокращенный тест МСЭ (256, 1280, 1518)\n"
            "6: Сокращенный тест КК (256, 1280, 1518)\n"
            "0: Выход\n"
        ))

        if main_input == 1:
            througput_and_cc_run("L3", "long")
        if main_input == 2:
            througput_and_cc_run("CGW_MCE", "long")
        if main_input == 3:
            througput_and_cc_run("L2", "long")
        if main_input == 4:
            througput_and_cc_run("L3", "short")
        if main_input == 5:
            througput_and_cc_run("CGW_MCE", "short")
        if main_input == 6:
            througput_and_cc_run("L2", "short")
        if main_input == 0:
                sys.exit(0)
        elif not main_input in range(0, 7):
            print("Введите номер теста")
            main_menu()
    except ValueError:
            print("Некорректное значение, введите число от 0 до 6")# после окончания теста происходит перезапуск с выводо этой строчки
            main_menu()                    #понять и исправить
main_menu()


