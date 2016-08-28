from subprocess import Popen, PIPE
import sys, time, os, re, fileinput, csv, openpyxl
global Ixiawish
Ixiawish = r'C:\Program Files (x86)\Ixia\Tcl\8.5.12.0\bin\wish85.exe'

def file_searcher():
    for filenames in os.walk('%s\%s' % (root, folder_name)):
        for filename in filenames:
            if filename[-3:] == 'tcl' or filename[-3:] == 'txt' in filename:

            else:
                print "Не обнаружено тестовых скриптов"



def run_ixia_wish(RepResultDir, RepLogName, Title):
    print ("Iam Worked")
    file_searcher()
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