import sys, time, os, re, fileinput

def configfilecreator(RepPortIdClient, RepPortIdServer, RepCardIdClient, RepCardIdServer,
                      RepPortType, TestPathResult, RepFrameResult, RepLogName, Title, Template, test_case, LogResultDir):
    LogName = '"?NameResult?"'                                      #основной сборщик TCL конфига, который далее идет на вход к IxiaWish
    CardIdClient = "?CardIdClient?"                                 #в начале функции есть список ключевых слов(LogName, CardIdClient и т.п. отмеченые ? в тексте), которые ищет функция
    PortIdClient = "?PortIdClient?"                                 #в шаблоне Template, разбирает его построчно и пишет в новый файл RunFile.tcl, ключевые слова заменяются в зависимости
    CardIdServer = "?CardIdServer?"                                 # от теста и в файл идут результаты выбранных юзером портов, номер карты в зависимости от теста, тип(L2, l3, CGW)
    PortIdServer = "?PortIdServer?"                                 #имя теста и пакета которые формируют путь к логу в конце. На вход к иксии подается распарсенная
    FrameResult = "?FrameResult?"                                   # строка (из нее убираются кавычки и двойной слеш), так как в tcl файле строка с указанным путем имеет больше слешей и кавычки
    ResultDir = '"?ResultDir?"'
    SourceFile = open(Template, 'r')
    TclFile = open('RunFile.tcl', 'w')
    PortType = '"?PortType?"'
    RepResultDir = '"' + LogResultDir + r'\\%s\\%s"' % (TestPathResult, RepLogName)
    ConcConectCount = '?ConcConnect?'


    for line in SourceFile:
        count = 0
        for word in line.split():

            if word == CardIdClient:
                TclFile.write(line.replace(word, RepCardIdClient))
                count = 1
            elif word == PortIdClient:
                TclFile.write(line.replace(word, RepPortIdClient))
                count = 1
            elif word == CardIdServer:
                TclFile.write(line.replace(word, RepCardIdServer))
                count = 1
            elif word == PortIdServer:
                TclFile.write(line.replace(word, RepPortIdServer))
                count = 1
            elif word == PortType:
                TclFile.write(line.replace(word, '"%s"' % (RepPortType)))
                count = 1
            elif word == FrameResult:
                TclFile.write(line.replace(word, RepFrameResult))
                count = 1
            elif word == ResultDir:
                TclFile.write(line.replace(word, RepResultDir))
                count = 1
            elif word == LogName:
                TclFile.write(line.replace(word, '"%s"' % (RepLogName)))
                count = 1
            elif word == ConcConectCount:
                TclFile.write(line.replace(word, test_case))
                count = 1

        if count == 0:
            TclFile.write(line)

    SourceFile.close()
    TclFile.close()
    RepResultDir = re.sub(r"\\", RepResultDir[1:-1], '\\')

    print(RepResultDir)
    #run_ixia_wish(RepResultDir, RepLogName, Title)

    TclFile = open('RunFile.tcl', 'r')                                             #Блок тестирования создания заполненных конфигов.
    TestResultFile = open('%s%s%s.tcl' % (Title, test_case, RepLogName), 'w' )     #При раскоменчивании надо заккоментить вызов функции
    for allline in TclFile:                                                        #run_ixia_wish выше и переменную testcase при вызове
        TestResultFile.write(allline)                                              #configfilecreator в функциях maxthroughput_cgw и
    TclFile.close()                                                                #concurrent_connections, чтобы в папке проверить корректность
    TestResultFile.close()                                                         #созданных конфиг файлов перед их запуском на Иксии.
