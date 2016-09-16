# -*- coding: utf8 -*-


import json

from create_test_frame import frame
from port_entering import config_file_parser


# print(test_cases)
def template_choose(TypeChoice, specific_test):
    template_list = []
    for all_specific in specific_test.split(","):
        if all_specific == "Throughput":
            if TypeChoice[-2:] == "L3":
                Template = "L3_Template_Throughput.txt"
            if TypeChoice[-2:] == "L2":
                Template = "L2_Template_Throughput.txt"
            if TypeChoice[-2:] == "FW":
                Template = "FW_Template_Throughput.txt"
            # print(all_specific)
            template_list.append(Template)
            continue
        if all_specific == "ConcurentConnections":
            # print(all_specific)
            if TypeChoice[-2:] == "L3":
                Template = "L3_Template_ConcurentС.txt"
            if TypeChoice[-2:] == "L2":
                Template = "L2_Template_ConcurentС.txt"
            if TypeChoice[-2:] == "FW":
                Template = "FW_Template_ConcurentС.txt"
            template_list.append(Template)
            break
        else:
            final_template = glob.glob("./templates/*.txt")
            for all_templ in  final_template:
                listic = str(all_templ[12:])
                template_list.append(listic)


    return template_list


def all_throughput_test_contain(TypeChoice, num_of_platform):
    #LogResultDir = r'%s\\TCP' % (num_of_platform) вынести отсюда
    #resultOfPortchooser = port_chooser(TypeChoice)                            #здесь вызов функции выбора портов
    #resultOfPortchooser = " ".join(resultOfPortchooser)     не надо это


    test_atemprt = open('standart_config.json')
    stream = test_atemprt.read()
    json_config = json.loads(stream)
    test_cases = json_config['test_cases']
    case = test_cases['case']
    specific_test = test_cases['specific']

    template_list = template_choose(TypeChoice, specific_test)
    print(template_list)
    for all_templates in template_list:
        if all_templates == "Throughput":
            for all_tests in case.split(","):                                                        #Тест запускается трижды -
                print(all_tests)
                if all_tests == "Reg":
                    print(all_tests)
                    userinput = input("Включите регистрацию пакетов на DUT и нажмите Enter, введите 'N' чтобы пропустить тест\n ")
                    if userinput == 'N' or userinput == 'n':
                        continue
                    else:
                        #frame(test_frame_size)                                                                              #1) с включенной регистрацией, давая выбор юзеру
                        config_file_parser(TypeChoice, num_of_platform, all_tests)
                        #packet_and_case_chooser(resultOfPortchooser, testcase, TypeChoice, type, LogResultDir)                  #запуск функции с строкой содержащей номера и тип портов +
                        print("Выполняется тест с включенной регистрацией пакетов\n ")                                               #название кейса для папки с результатами и тип теста - длиный или короткий

                if all_tests == 2 and TypeChoice != "L2":
                    userinput = input("Выключите регистрацию пакетов, выставите 25 ПФ и нажмите Enter, введите 'N' чтобы пропустить тест\n ")
                    if userinput == 'N' or userinput == 'n':
                        continue                                                                #2) с 25ю ПФ
                    else:
                        testcase = "25"
                        print("Выполняется тест с 25 ПФ\n ")
                        packet_and_case_chooser(resultOfPortchooser, testcase, TypeChoice, type, LogResultDir)

                if all_tests == 3:
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

                # for CC in range(1,4):                                                               #запуск теста с конкурентными сессиями
                #     if CC == 1:
                #         testcase = "1"
                #         print("Выполняется тест на 1й сессии\n ")
                #         packet_and_case_chooser(resultOfPortchooser, testcase, TypeChoice, type, LogResultDir)
                #     if CC == 2:
                #         testcase = "16"
                #         print("Выполняется тест на 16ти сессиях\n ")
                #         packet_and_case_chooser(resultOfPortchooser, testcase, TypeChoice, type, LogResultDir)
                #     if CC == 3:
                #         testcase = "100"
                #         print("Выполняется тест на 100 сессиях\n ")
                #         packet_and_case_chooser(resultOfPortchooser, testcase, TypeChoice, type, LogResultDir)

            else:
                config_file_parser(TypeChoice, num_of_platform, all_tests)
    print("\n***************************************\n")
    print("Тесты закончены")
    print("\n***************************************\n")
    # ParsLogResultDir = re.sub(r"\\", LogResultDir, '\\')
    # initialize_stat(ParsLogResultDir, num_of_platform)
    # print("\nРезультаты собраны в файл " + file)
    # if count_Of_Zero > 0:
    #     print ("\n!!!!!!!!!!!!!!\nWARNING\n!!!!!!!!!!!!!!\n")
    #     print ("В тесте обнаружено", count_Of_Zero, "нулевых значений")
    #     print ("Просмотрите лог выше, в тестах с пометкой Fail возможны просадки")

