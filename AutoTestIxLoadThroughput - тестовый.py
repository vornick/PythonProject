# -*- coding: utf8 -*-
from subprocess import Popen, PIPE
import sys, time, os, re, fileinput, csv, openpyxl
from openpyxl import load_workbook, Workbook
from openpyxl.cell import get_column_letter
from configfilecreo import configfilecreator
from parser import initialize_stat

global Ixiawish
Ixiawish = r'C:\Program Files (x86)\Ixia\Tcl\8.5.12.0\bin\wish85.exe'

# def initialize_stat(ParsLogResultDir, num_of_platform):
#     global EndResultDir, tcp, udp, l2, l3, mse, thr, con, pf, reg, st, con1, con16, con100, pac1, pac2, pac3, pac4, pac5, pac6, res_filename, file, i, count_Of_Zero
#     EndResultDir = ParsLogResultDir
#     tcp = 'TCP'
#     udp='UDP'
#     l2='L2'
#     l3='L3'
#     mse='CGW_MCE'
#     thr='MaxThroughput'
#     con='ConcurrentConnections'
#     pf='25\\'
#     reg='Reg'
#     st='Standart'
#     con1='1\\'
#     con16='16\\'
#     con100='100\\'
#     pac1='256\\'
#     pac2='512\\'
#     pac3='1024\\'
#     pac4='1280\\'
#     pac5='1518\\'
#     pac6='1400\\'
#     i=0
#     count_Of_Zero = 0
#     res_filename = num_of_platform + '_TestResult.xlsx'
#     file=EndResultDir + '\\' + res_filename
#     print("Запускается сбор статистики в файл" + file)
#     main(count_Of_Zero)
#
# def main(count_Of_Zero):
#     if not os.path.exists(EndResultDir):
#         os.mkdir(EndResultDir)
#     wb = Workbook()
#     wb.save(file)
#     global i
#     tree = os.walk(EndResultDir)
#     for d, dirs, files in tree:
#         for f in files:
#             if f == "HTTP_Client.csv":
#                 path=os.path.join (d,f)
#                 print(path)
#
#                 if path.find(tcp)>0:
#                     u=1
#                     write('A%s' % u, tcp)
#                 elif path.find(udp)>0:
#                     u=30
#                     write('A%s' % u, udp)
#
#                 if path.find(thr)>0:
#                     a=u+1
#                     write('B%s' % a, thr)
#                 elif path.find(con)>0:
#                     a=u+15
#                     write('B%s' % a, con)
#
#                 if path.find(l3)>0:
#                     b=a+1
#                     write('C%s' % b, 'L3')
#                 elif path.find(mse)>0:
#                     b=a+5
#                     write('C%s' % b, 'МСЭ')
#                 elif path.find(l2)>0:
#                     b=a+9
#                     write('C%s' % b, 'L2')
#
#                 if path.find(st)>0:
#                     c=b+1
#                     write('D%s' % c, 'Без регистрации')
#                 elif path.find(reg)>0:
#                     c=b+2
#                     write('D%s' % c, 'С регистрацией')
#                 elif path.find(pf)>0:
#                     c=b+3
#                     write('D%s' % c, '25 ПФ')
#
#                 if path.find(con1)>0:
#                     c=b+1
#                     write('D%s' % c, 1)
#                 elif path.find(con16)>0:
#                     c=b+2
#                     write('D%s' % c, 16)
#                 elif path.find(con100)>0:
#                     c=b+3
#                     write('D%s' % c, 100)
#
#                 if path.find(pac1)>0:
#                     write('E%s' % a, 256)
#                     csvfile(path)
#                     write('E%s' % c, csvfile(path))
#                 elif path.find(pac2)>0:
#                     write('F%s' % a, 512)
#                     csvfile(path)
#                     write('F%s' % c, csvfile(path))
#                 elif path.find(pac3)>0:
#                     write('G%s' % a, 1024)
#                     csvfile(path)
#                     write('G%s' % c, csvfile(path))
#                 elif path.find(pac4)>0:
#                     write('H%s' % a, 1280)
#                     csvfile(path)
#                     write('H%s' % c, csvfile(path))
#                 elif path.find(pac5)>0:
#                     write('I%s' % a, 1518)
#                     csvfile(path)
#                     write('I%s' % c, csvfile(path))
#                 elif path.find(pac6)>0:
#                     write('J%s' % a, 1400)
#                     csvfile(path)
#                     write('J%s' % c, csvfile(path))
#                 i+=1
#                 print('-----------------------------',i)
#
# def csvfile(path):
#     infile=open(path, 'r')
#     rdr=csv.reader(infile)
#     zn=0
#     count=0
#     zero_count=0
#     srzn=0
#     list_rdr = list(rdr)
#     first_count = 16
#     last_count = 76
#     for cnt in range(first_count, last_count):
#         row = list_rdr[cnt]
# #		print(row)
#         if int(row[95])>0:
#             zn+=int(row[95])
#             count+=1
#             srzn=zn/count
#         else:
#             zero_count+=1
#             #print(zero_count)
#     infile.close()
#     if zero_count==0:
#         print('Passed')
#     else:
#         print('Fail',zero_count)
#         zero_counter(zero_count)
#     return srzn
#
# def write(pos, val):
#     wb = load_workbook(file)
#     ws = wb.active
#     ws[pos]=val
#     wb.save(file)
#
# def zero_counter(zero_count):
#     global count_Of_Zero
#     count_Of_Zero = count_Of_Zero + zero_count
#     return count_Of_Zero

def run_ixia_wish(RepResultDir, RepLogName, Title):

    print ('Тест %s с размером пакета в %s выполняется\n' % (Title, RepLogName))
    TclFile = r'RunFile.tcl'
    process = Popen([                                               #основная функция которая запускает IxLoad, подавая ему на вход собранный файл с тестом
    Ixiawish,                                                       #функция запускается в цикле описанным ниже, выход из цикла в случае отработки 2-х минут
    TclFile                                                         #то есть когда тест полностью отработал, отчет стартует при появлении лог файла в папке с результатом
    ])
    while True:
        for dirpath, dirnames, filenames in os.walk(RepResultDir):     #функция гасит диалоговое окно процесса IxiaWish, чтобы не плодить окна по всему столу
            time.sleep(5)                                              #она каждые 15 секунд ждет появления сигнала о начале теста, сигналом служит появление
            for filename in filenames:                                 #лог файла с расширением CSV в папке с результатом, как только он появляется,
                if filename[-3:] == 'csv':                             #активируется таймер сна равный 2м минутам работы теста, и по окончании таймера, окно
                    time.sleep(170)                                    #c отработавшим тестом гасится
                    process.terminate()
                    print ('Тест %s с размером пакета в %s закончен\n' % (Title, RepLogName))
                    return False
                    break
                else:
                    time.sleep(5)
                    True



# def configfilecreator(RepPortIdClient, RepPortIdServer, RepCardIdClient, RepCardIdServer,
#                       RepPortType, TestPathResult, RepFrameResult, RepLogName, Title, Template, test_case, LogResultDir):
#
#     LogName = '"?NameResult?"'                                      #основной сборщик TCL конфига, который далее идет на вход к IxiaWish
#     CardIdClient = "?CardIdClient?"                                 #в начале функции есть список ключевых слов(LogName, CardIdClient и т.п. отмеченые ? в тексте), которые ищет функция
#     PortIdClient = "?PortIdClient?"                                 #в шаблоне Template, разбирает его построчно и пишет в новый файл RunFile.tcl, ключевые слова заменяются в зависимости
#     CardIdServer = "?CardIdServer?"                                 # от теста и в файл идут результаты выбранных юзером портов, номер карты в зависимости от теста, тип(L2, l3, CGW)
#     PortIdServer = "?PortIdServer?"                                 #имя теста и пакета которые формируют путь к логу в конце. На вход к иксии подается распарсенная
#     FrameResult = "?FrameResult?"                                   # строка (из нее убираются кавычки и двойной слеш), так как в tcl файле строка с указанным путем имеет больше слешей и кавычки
#     ResultDir = '"?ResultDir?"'
#     SourceFile = open(Template, 'r')
#     TclFile = open('RunFile.tcl', 'w')
#     PortType = '"?PortType?"'
#     RepResultDir = '"' + LogResultDir + r'\\%s\\%s"' % (TestPathResult, RepLogName)
#     ConcConectCount = '?ConcConnect?'
#
#     for line in SourceFile:
#         count = 0
#         for word in line.split():
#
#             if word == CardIdClient:
#                 TclFile.write(line.replace(word, RepCardIdClient))
#                 count = 1
#             elif word == PortIdClient:
#                 TclFile.write(line.replace(word, RepPortIdClient))
#                 count = 1
#             elif word == CardIdServer:
#                 TclFile.write(line.replace(word, RepCardIdServer))
#                 count = 1
#             elif word == PortIdServer:
#                 TclFile.write(line.replace(word, RepPortIdServer))
#                 count = 1
#             elif word == PortType:
#                 TclFile.write(line.replace(word, '"%s"' % (RepPortType)))
#                 count = 1
#             elif word == FrameResult:
#                 TclFile.write(line.replace(word, RepFrameResult))
#                 count = 1
#             elif word == ResultDir:
#                 TclFile.write(line.replace(word, RepResultDir))
#                 count = 1
#             elif word == LogName:
#                 TclFile.write(line.replace(word, '"%s"' % (RepLogName)))
#                 count = 1
#             elif word == ConcConectCount:
#                 TclFile.write(line.replace(word, test_case))
#                 count = 1
#
#         if count == 0:
#             TclFile.write(line)
#
#     SourceFile.close()
#     TclFile.close()
#     RepResultDir = re.sub(r"\\", RepResultDir[1:-1], '\\')
#
#     print(RepResultDir)
#     #run_ixia_wish(RepResultDir, RepLogName, Title)
#
#     TclFile = open('RunFile.tcl', 'r')                                             #Блок тестирования создания заполненных конфигов.
#     TestResultFile = open('%s%s%s.tcl' % (Title, test_case, RepLogName), 'w' )     #При раскоменчивании надо заккоментить вызов функции
#     for allline in TclFile:                                                        #run_ixia_wish выше и переменную testcase при вызове
#         TestResultFile.write(allline)                                              #configfilecreator в функциях maxthroughput_cgw и
#     TclFile.close()                                                                #concurrent_connections, чтобы в папке проверить корректность
#     TestResultFile.close()                                                         #созданных конфиг файлов перед их запуском на Иксии.
#


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
    file = initialize_stat(ParsLogResultDir, num_of_platform)
    print("\nРезультаты собраны в файл " + file)
    if count_Of_Zero > 0:
        print ("\n!!!!!!!!!!!!!!\nWARNING\n!!!!!!!!!!!!!!\n")
        print ("В тесте обнаружено", count_Of_Zero, "нулевых значений")
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
    main_input = input(
        "Введите номер теста:\n"
        "1: Полный тест L3\n"
        "2: Полный тест МСЭ\n"
        "3: Полный тест КК\n"
        "4: Сокращенный тест L3 (256, 1280, 1518)\n"
        "5: Сокращенный тест МСЭ (256, 1280, 1518)\n"
        "6: Сокращенный тест КК (256, 1280, 1518)\n"
        "0: Выход\n"
                       )
    if main_input == "1":
        througput_and_cc_run("L3", "long")
    if main_input == "2":
        througput_and_cc_run("CGW_MCE", "long")
    if main_input == "3":
        througput_and_cc_run("L2", "long")
    if main_input == "4":
        througput_and_cc_run("L3", "short")
    if main_input == "5":
        througput_and_cc_run("CGW_MCE", "short")
    if main_input == "6":
        througput_and_cc_run("L2", "short")
    if main_input == "0":
        sys.exit(0)
    #else:
    #    print("Некорректное значение")# после окончания теста происходит перезапуск с выводо этой строчки
     #   main_menu()                    понять и исправить
    #card_port_chooser(type)
     #Tclscript = "C:\CGW_TCP_TEST\CGW_single(MCE)\Max_Throughput"
main_menu()
