# -*- coding: utf8 -*-
from subprocess import Popen, PIPE
import sys, time, os, re, fileinput, csv, openpyxl

global Ixiawish
Ixiawish = r'C:\Program Files (x86)\Ixia\Tcl\8.5.12.0\bin\wish85.exe'


def test_check_and_run(folder_name, Template_File, frame):
    # file_searcher(folder_name) test for win
    template_check(Template_File)
    run_ixia_wish(folder_name, frame)
    test_function(folder_name, frame, Template_File)

def file_searcher(folder_name):
    for filenames in os.walk('%s\%s' % (root, folder_name)):
        for filename in filenames:
            if filename[-3:] == 'tcl' or filename[-3:] == 'txt' in filename:
                continue
            else:
                print("Не обнаружено тестовых скриптов")


def template_check(Template_File):
    EndFile = open(Template_File, 'r')
    check = 0
    linenum = 0
    lists = []
    for lines in EndFile:
        linenum += 1
        for wordr in lines.split():
            for chara in wordr:
                if chara == "?":
                    check += 1
                    numofline = lists.append(linenum)
                    break

    print("In Test file " + str(check) + " template words on lines", lists)
    EndFile.close()

def run_ixia_wish(folder_name, frame):
    print("")
    # file_searcher()
    # print ('Тест %s с размером пакета в %s выполняется\n' % (Title, RepLogName))
    # TclFile = r'RunFile.tcl'
    # process = Popen([                                               #основная функция которая запускает IxLoad, подавая ему на вход собранный файл с тестом
    # Ixiawish,                                                       #функция запускается в цикле описанным ниже, выход из цикла в случае отработки 2-х минут
    # TclFile                                                         #то есть когда тест полностью отработал, отчет стартует при появлении лог файла в папке с результатом
    # ])
    # while True:
    #     for dirpath, dirnames, filenames in os.walk(RepResultDir):     #функция гасит диалоговое окно процесса IxiaWish, чтобы не плодить окна по всему столу
    #         time.sleep(5)                                              #она каждые 15 секунд ждет появления сигнала о начале теста, сигналом служит появление
    #         for filename in filenames:                                 #лог файла с расширением CSV в папке с результатом, как только он появляется,
    #             if filename[-3:] == 'csv':                             #активируется таймер сна равный 2м минутам работы теста, и по окончании таймера, окно
    #                 time.sleep(170)                                    #c отработавшим тестом гасится
    #                 process.terminate()
    #                 print ('Тест %s с размером пакета в %s закончен\n' % (Title, RepLogName))
    #                 return False
    #                 break
    #             else:
    #                 time.sleep(5)
    #                 True

def test_function(folder_name, frame, Template_File):
    TclFile = open(Template_File, 'r')
                                                          #Блок тестирования создания заполненных конфигов.
    TestResultFile = open('%s%s.tcl' % (folder_name, frame), 'w' )     #При раскоменчивании надо заккоментить вызов функции
    for allline in TclFile:                                                        #run_ixia_wish выше и переменную testcase при вызове
        TestResultFile.write(allline)
    TclFile.close()
    TestResultFile.close()
