# -*- coding: utf8 -*-
import json
from IxiaRunner import test_check_and_run

conf_file = open('standart_config.json')
stream = conf_file.read()
json_config = json.loads(stream)
Ixia_settings = json_config['settings']
frame_size = json_config['?FrameResult?']
Template_File = "./template/"
Runnuble_tcl_file = 'RunFile.tcl'






def config_file_parser(enter_num, num_of_platform, all_tests):

    # ports_client = Ixia_settings_of_client['?PortIdClient?']
    #    if ports [:7] == "?PortId":
    # enter_num = "default"
    # enter_num = "short_CGW"
    concurent_connectuion_test = "default"
    frame_size_inner(enter_num, frame_size, all_tests, num_of_platform, Template_File, Runnuble_tcl_file)






def frame_size_inner(enter_num, frame_size, all_tests, num_of_platform, Template_File, Runnuble_tcl_file):

    frame = frame_size[enter_num]
    if enter_num == "default":
        log_name_frame = log_name_assign(frame)
        line_parser(enter_num, log_name_frame)
    else:
        for key_word in frame_size:
            if key_word == enter_num:
                frame_list = frame_size[key_word]
                for frame_in_list in frame_list.split(","):
                    log_name_frame = log_name_assign(frame_in_list)
                    line_parser(frame_in_list, log_name_frame, all_tests, num_of_platform, Template_File, Runnuble_tcl_file)




def line_parser(frame_in_list, log_name_frame, all_tests, num_of_platform, Template_File, Runnuble_tcl_file):

    SourceFile = open(Template_File, 'r')
    EndFile = open(Runnuble_tcl_file, 'w')
    global result_directory
    result_directory = ""
    for line in SourceFile:
        count = 0
        for word in line.split():
            for all_set in Ixia_settings:
                if word == ''"?ResultDir?'":
                    x = Ixia_settings[word]
                    list_of_result = []
                    result_directory = x + r'\%s\%s\%s' % (num_of_platform, all_tests, log_name_frame)
                    for splitchar in result_directory:
                        if splitchar == "\\":
                            splitchar = splitchar + '\\'
                        list_of_result.append(splitchar)
                    doubleslash_result_directory = '"%s"' % (''.join(list_of_result))
                    EndFile.write(line.replace(word, doubleslash_result_directory))
                    count = 1
                    break

                if all_set == word:
                    x = Ixia_settings[all_set]
                    EndFile.write(line.replace(word, x))
                    count = 1

                elif all_set == str(word[1:-1]):
                    x = Ixia_settings[all_set]
                    EndFile.write(line.replace(word, '"%s"' % (x)))
                    count = 1
            if word == "?FrameResult?":
                EndFile.write(line.replace(word, frame_in_list))
                count = 1
            if word == '"?NameResult?"':
                EndFile.write(line.replace(word, '"%s"' % (log_name_frame)))
                count = 1
        if count == 0:
            EndFile.write(line)
    else:
        EndFile.close()
        SourceFile.close()
        test_check_and_run(result_directory, Runnuble_tcl_file, frame_in_list)
                        # if concurent_connectuion_test == "default"
                        #     print ("Propyskaem Test")
                        # else:






def log_name_assign(test_frame):
    test_frame = int(test_frame)
    if test_frame == 1460 and test_frame != 1390:
        frame_incr = 58
    elif test_frame == 1408:
        frame_incr = -8
    elif test_frame == 1390:
        frame_incr = 10
    else:
        frame_incr = 40
    # RepFrameResult = str(test_frame)
    frame_for_logname = str(test_frame + frame_incr)
    return frame_for_logname








#
#
# class UserInput():
#     def PlatformChooser(self):
#         num_of_platform = input(
#         "Введите тип платформы: IPC-"
#         )
#         return num_of_platform
#     def portChooser(TypeChoice):
#         print ("Выберите порты Ixia которые скоммутированы с вашим DUT\n"
#                "Внимание порты не должны использоваться в каком-либо другом тесте,"
#                " они должны быть очищены в IxNetwork\n")
#         if TypeChoice == "CGW_MCE":
#             port = "154.1.1.2"
#             port2 = "39.3.3.2"
#         elif TypeChoice == "L3":
#             port = "154.1.1.2"
#             port2 = "134.1.1.2"
#         elif TypeChoice == "L2":
#             port = "1.1.1.2"
#             port2 = "1.1.1.1"
#         port_of_card1 = input(
#              "Введите номер порта (IP %s) из Шасси 1 - нижняя от 1 до 12: " % (port)                         #функция выбора портов. всегда идет за главным меню, возвращает
#         )
#                                                                                   #cтроку с номерами и типами портов, спрашивая о них юзера и не давая ввести порты после №12
#         port_of_card2 = input(
#             "Введите номер порта (IP %s) из Шасси 2 - верхняя от 1 до 12: " % (port2)
#         )
#         user_choose_port = input ("По умолчанию выбран тип порта - медь, нажмите Enter чтобы продолжить, для выбора оптики введите F ")
#         if user_choose_port == "F" or user_choose_port == "f":
#             type_port = "fiber"
#         else:
#             type_port = "copper"
#
#         if int(port_of_card1) in range(1,13) and int (port_of_card2) in range(1,13):
#             print ("\n\n тип порта " + type_port + "\n" + " порт на 1ом шасси - " + port_of_card1 + ", IP - " + port
#                 + "\n" + " порт на 2м шасси - " + port_of_card2 + ", IP - " + port2 + "\n")
#             user_confirm = input ("Enter чтобы продолжить, N - возврат к выбору портов")
#             if user_confirm == "n" or user_confirm == "N":
#                 port_chooser(TypeChoice)
#             else:
#                 return port_of_card1, port_of_card2, type_port
#
#         else:
#             print ("\n" + "Некорректный номер порта, введите число от 1 до 12")
#             port_chooser(TypeChoice)
#
