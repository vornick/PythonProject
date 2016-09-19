# -*- coding: utf8 -*-
from subprocess import Popen, PIPE
import sys, time, os, re, fileinput, csv #, openpyxl
# from openpyxl import load_workbook, Workbook
# from openpyxl.cell import get_column_letter
from throughput_test_CC_and_frame_size import all_throughput_test_contain
from create_test_frame import frame

class Menu(object):

    def main_menu(self):
        print("\n===== Измерение производительности TCP v. 1.1 ====\n")
        try:
            main_input = int(input(
                "Введите номер теста:\n"
                "1: Полный тест L3\n"
                "2: Полный тест МСЭ\n"
                "3: Полный тест КК\n"
                "4: Сокращенный тест L3 (256, 1280, 1518)\n"
                "5: Сокращенный тест МСЭ (256, 1280, 1518)\n"
                "6: Сокращенный тест КК (256, 1280, 1518)\n"
                "0: Назад\n"
                           ))
            if main_input == 1:
                user_input = TestSteps.test_choice("long_L3")
            if main_input == 2:
                uaer_input = TestSteps.test_choice("long_FW")
            if main_input == 3:
                user_input = TestSteps.test_choice("long_L2")
            if main_input == 4:
                uaer_input = TestSteps.test_choice("short_L3")
            if main_input == 5:
                user_input = TestSteps.test_choice("short_FW")
            if main_input == 6:
                user_input = TestSteps.test_choice("short_L2")
            if main_input == 0:
                Menu.first_menu(0)
            elif not main_input in range(0, 7):
                print("Введите номер теста")
                Menu.main_menu(0)
        except ValueError:
            print("Некорректное значение, введите число от 0 до 6")# после окончания теста происходит перезапуск с выводо этой строчки
            Menu.main_menu(0)
        #user_input.througput_and_cc_run


    def first_menu(self):
        try:
            first_menu_input = int(input(
                "Выберите действие:\n"
                "1: Тестирование пропускной способности (FW,L2,L3,IDS)\n"
                "2: Подгрузить шаблон с условиями в conf.json\n"
                "3: Подгрузить шаблон без условий\n"
                "4: Сбор статистики\n"
                "0: Выход\n"
                           ))
            if first_menu_input == 1:
                Menu.main_menu(0)
            if first_menu_input == 2:
                print ("В разработке")
                Menu.first_menu(0)
            if first_menu_input == 3:
                print ("В разработке")
                Menu.first_menu(0)
            if first_menu_input == 4:
                print ("В разработке")
                Menu.first_menu(0)
            if first_menu_input == 0:
                sys.exit(0)
            elif not first_menu_input in range(0, 4):
                print("Введите номер теста")
                Menu.first_menu(0)
            # input.througput_and_cc_run

        except ValueError:
            print("Некорректное значение, введите число от 0 до 4")# после окончания теста происходит перезапуск с выводо этой строчки
            Menu.first_menu(0)


class UserInput():
    def PlatformChooser(TypeChoice,self):
        num_of_platform = input(
        "Введите тип платформы: IPC-"
        )
        all_throughput_test_contain(TypeChoice, num_of_platform)
        # return num_of_platform
    def portChooser(TypeChoice):
        print(none)

class TestSteps():
    def test_choice(TypeChoice):
        # num_of_platform = UserInput()
        # num_of_platform.PlatformChooser()
        # num_of_platform = str(num_of_platform)
        # print(num_of_platform)
        num_of_platform = input(
            "Введите тип платформы: IPC-"
        )
        all_throughput_test_contain(TypeChoice, num_of_platform)

Menu.first_menu(0)
        # print ("Выберите порты Ixia которые скоммутированы с вашим DUT\n"
        #        "Внимание порты не должны использоваться в каком-либо другом тесте,"
        #        " они должны быть очищены в IxNetwork\n")
        # if TypeChoice == "CGW_MCE":
        #     port = "154.1.1.2"
        #     port2 = "39.3.3.2"
        # elif TypeChoice == "L3":
        #     port = "154.1.1.2"
        #     port2 = "134.1.1.2"
        # elif TypeChoice == "L2":
        #     port = "1.1.1.2"
        #     port2 = "1.1.1.1"
        # port_of_card1 = input(
        #      "Введите номер порта (IP %s) из Шасси 1 - нижняя от 1 до 12: " % (port)                         #функция выбора портов. всегда идет за главным меню, возвращает
        # )
        #                                                                           #cтроку с номерами и типами портов, спрашивая о них юзера и не давая ввести порты после №12
        # port_of_card2 = input(
        #     "Введите номер порта (IP %s) из Шасси 2 - верхняя от 1 до 12: " % (port2)
        # )
        # user_choose_port = input ("По умолчанию выбран тип порта - медь, нажмите Enter чтобы продолжить, для выбора оптики введите F ")
        # if user_choose_port == "F" or user_choose_port == "f":
        #     type_port = "fiber"
        # else:
        #     type_port = "copper"
        #
        # if int(port_of_card1) in range(1,13) and int (port_of_card2) in range(1,13):
        #     print ("\n\n тип порта " + type_port + "\n" + " порт на 1ом шасси - " + port_of_card1 + ", IP - " + port
        #         + "\n" + " порт на 2м шасси - " + port_of_card2 + ", IP - " + port2 + "\n")
        #     user_confirm = input ("Enter чтобы продолжить, N - возврат к выбору портов")
        #     if user_confirm == "n" or user_confirm == "N":
        #         port_chooser(TypeChoice)
        #     else:
        #         return port_of_card1, port_of_card2, type_port
        #
        # else:
        #     print ("\n" + "Некорректный номер порта, введите число от 1 до 12")
        #     port_chooser(TypeChoice)


#Menu.main_menu(0)
# class ChoosePacket_CreateTCL_IxiaRun():
#
#
# class ExternalFiles():