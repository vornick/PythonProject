# -*- coding: utf8 -*-
from subprocess import Popen, PIPE
import sys, time, os, re, fileinput, csv #, openpyxl
# from openpyxl import load_workbook, Workbook
# from openpyxl.cell import get_column_letter
from throughput_test_CC_and_frame_size import TestChoice

class Menu(object):

    def main_menu(self):
        print("\n===== Измерение производительности TCP v. 1.1 ====\n")
        # try:
        main_input = int(input(
                "Введите номер теста:\n"
                "1: Полный тест L3\n"
                "2: Полный тест МСЭ\n"
                "3: Полный тест КК\n"
                "4: Сокращенный тест L3 (256, 1280, 1518)\n"
                "5: Сокращенный тест МСЭ (256, 1280, 1518)\n"
                "6: Сокращенный тест КК (256, 1280, 1518)\n"
                "7: Тесты 10Gb оптики (IPC-3000, IPC-2000)\n"
                "0: Назад\n"
                           ))
        if main_input == 1:
            user_input = TestSteps.test_choice("long_L3")
        if main_input == 2:
            uaer_input = TestSteps.test_choice("long_FW")
        if main_input == 3:
            user_input = TestSteps.test_choice("long_L2")
        if main_input == 4:
            user_input = TestSteps.test_choice("short_L3")
        if main_input == 5:
            user_input = TestSteps.test_choice("short_FW")
        if main_input == 6:
            user_input = TestSteps.test_choice("short_L2")
        if main_input == 7:
            user_input = Menu.menu_3000(0)
        if main_input == 0:
            Menu.first_menu(0)
        elif not main_input in range(0, 7):
                print("Введите номер теста")
                Menu.main_menu(0)
        # except ValueError:
        #     print("Некорректное значение, введите число от 0 до 6")# после окончания теста происходит перезапуск с выводо этой строчки
        #     Menu.main_menu(0)
        #user_input.througput_and_cc_run


    def first_menu(self):
        # try:
        first_menu_input = int(input(
                "Выберите действие:\n"
                "1: Тестирование пропускной способности (FW,L2,L3)\n"
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

<<<<<<< HEAD
        #
        # except ValueError:
        #     print("Некорректное значение, введите число от 0 до 4")# после окончания теста происходит перезапуск с выводо этой строчки
        #     Menu.first_menu(0)
    def menu_3000(self):
        menu3000_input = int(input(
            "Выберите действие:\n"
            "1: Полный тест FW на 10Gb оптике IPC-3000, IPC-2000\n"
            "2: Полный тест L3 на 10Gb оптике IPC-3000, IPC-2000\n"
            "3: Полный тест L2 на 10Gb оптике IPC-3000, IPC-2000\n"
            "4: Сокращенный тест FW на 10Gb оптике IPC-3000, IPC-2000(256, 1280, 1518)\n"
            "5: Сокращенный тест L3 на 10Gb оптике IPC-3000, IPC-2000(256, 1280, 1518)\n"
            "6: Сокращенный тест L2 на 10Gb оптике IPC-3000, IPC-2000(256, 1280, 1518)\n"
        ))
        if menu3000_input == 1:
            user_input = TestSteps.test_choice("3000_10Glong_FW")
        # if first_menu_input == 2:
        #
        # if first_menu_input == 3:
        #
        # if first_menu_input == 4:
        #     print ("В разработке")
        #     Menu.first_menu(0)
        # if first_menu_input == 0:
        #     sys.exit(0)
        elif not first_menu_input in range(0, 4):
            print("Введите номер теста")
        Menu.first_menu(0)

class TestSteps():
    def test_choice(TypeChoice):
        if TypeChoice[:8] == "3000_10G":
            num_of_platform = TypeChoice[:8]
            TypeChoice = TypeChoice[8:]
        else:
            num_of_platform = input(
                "Введите тип платформы: IPC-"
            )
        print(TypeChoice)
        print(num_of_platform)
        TestChoice.all_throughput_test_contain(TypeChoice, num_of_platform)
=======

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
>>>>>>> ff64fec240fb0c944921886bfef4a67170402f70

Menu.first_menu(0)
