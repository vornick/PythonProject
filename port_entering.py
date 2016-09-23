# -*- coding: utf8 -*-
import json, os
from IxiaRunner import test_check_and_run
import throughput_test_CC_and_frame_size

<<<<<<< HEAD
=======
conf_file = open('standart_config.json')
stream = conf_file.read()
json_config = json.loads(stream)
Ixia_settings = json_config['settings']
frame_size = json_config['?FrameResult?']
>>>>>>> ff64fec240fb0c944921886bfef4a67170402f70
folder_template_file = 'templates'
Runnuble_tcl_file = 'RunFile.tcl'






<<<<<<< HEAD

=======
def config_file_parser(enter_num, num_of_platform, all_tests, Template_File):

    # ports_client = Ixia_settings_of_client['?PortIdClient?']
    #    if ports [:7] == "?PortId":
    # enter_num = "default"
    # enter_num = "short_CGW"
    concurent_connectuion_test = "default"

    frame_size_inner(enter_num, frame_size, all_tests, num_of_platform, Template_File, Runnuble_tcl_file)
>>>>>>> ff64fec240fb0c944921886bfef4a67170402f70


def frame_size_inner(TypeChoice, num_of_platform, all_tests, Template_File):
    DataClass = throughput_test_CC_and_frame_size.DataCash()
    test_type = TypeChoice[-2:]
    test_frames = DataClass.frames_in_test(TypeChoice)
    if TypeChoice == "default":
        log_name_frame = log_name_assign(frame, test_type)
        line_parser(TypeChoice, log_name_frame)
    else:
        for key_word in test_frames:
            if key_word == TypeChoice:
                frame_list = test_frames[key_word]
                for frame_in_list in frame_list.split(","):
<<<<<<< HEAD
                    log_name_frame = log_name_assign(frame_in_list, test_type)
                    line_parser(frame_in_list, log_name_frame, all_tests, num_of_platform, Template_File, test_type, TypeChoice)




def line_parser(frame_in_list, log_name_frame, all_tests, num_of_platform, Template_File, test_type, TypeChoice):
    DataClass = throughput_test_CC_and_frame_size.DataCash()
    Ixia_settings = DataClass.ixia_param(TypeChoice)
    EndFile = open(Runnuble_tcl_file, 'w')
    global result_directory
    result_directory = ""
    filename = Template_File
    for filename in os.listdir(folder_template_file):
        if filename == Template_File:
            print(filename)
            with open(os.path.join(folder_template_file, Template_File), "r") as SourceFile:
                for line in SourceFile:
                    count = 0
                    agregate_rev = 0

                    for word in line.split():
                        for all_set in Ixia_settings:
                            if word == '"?ResultDir?"':
                                x = Ixia_settings[word]
                                list_of_result = []
                                result_directory = x + r'\%s\%s\%s\%s' % (num_of_platform, test_type, all_tests, log_name_frame)
                                for splitchar in result_directory:
                                    if splitchar == "\\":
                                        splitchar = splitchar + '\\'
                                    list_of_result.append(splitchar)
                                print("результаты сохраняются в " + result_directory)
                                doubleslash_result_directory = '"%s"' % (''.join(list_of_result))
                                EndFile.write(line.replace(word, doubleslash_result_directory))
                                count = 1
                                break

                            if all_set == word:
                                x = Ixia_settings[all_set]
                                EndFile.write(line.replace(word, x))
                                count = 1

                            if word == "?Agregation_Resources?":
                                agregate_rev += 1
                                if agregate_rev == 1:
                                    chassisId = 1
                                    cardId = Ixia_settings["?CardIdClient?"]
                                    portId = Ixia_settings["?PortIdClient?"]
                                if agregate_rev == 2:
                                    chassisId = 1
                                    cardId = Ixia_settings["?CardIdServer?"]
                                    portId = Ixia_settings["?PortIdClient?"]
                                x = Ixia_settings["port_count"]
                                for port in portId:
                                    Agregation = "$Network1 portList.appendItem \\ \n" + \
                                                 "       - chassisId %s \\ \n" + \
                                                 "       - cardId %s \\ \n" + \
                                                 "       - portId %s \n" + \
                                                 "\n" % (chassisId, cardId, portId )
                                    EndFile.write(line.replace(word, Agregation))
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
                        if word == "?ConcConnect?":
                            EndFile.write(line.replace(word, all_tests))
                            count = 1
                    if count == 0:
                        EndFile.write(line)
        # elif filename != Template_File:
        #     print("Не обнаружено тестовых скриптов")
=======
                    log_name_frame = log_name_assign(frame_in_list)
                    print(log_name_frame)
                    line_parser(frame_in_list, log_name_frame, all_tests, num_of_platform, Template_File, Runnuble_tcl_file)




def line_parser(frame_in_list, log_name_frame, all_tests, num_of_platform, Template_File, Runnuble_tcl_file):
    EndFile = open(Runnuble_tcl_file, 'w')
    global result_directory
    result_directory = ""
    for filename in os.listdir(folder_template_file):
        with open(os.path.join(folder_template_file, Template_File), "r") as SourceFile:
            for line in SourceFile:
                count = 0
                for word in line.split():
                    for all_set in Ixia_settings:
                        if word == '"?ResultDir?"':
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
>>>>>>> ff64fec240fb0c944921886bfef4a67170402f70
    else:
        EndFile.close()
        SourceFile.close()
        test_check_and_run(result_directory, Runnuble_tcl_file, frame_in_list)
                                # if concurent_connectuion_test == "default"
                                #     print ("Propyskaem Test")
                                # else:






def log_name_assign(test_frame, test_type):
    test_frame = int(test_frame)
    if test_frame == 1460 or test_type == "L2" and test_frame != 1390:
        frame_incr = 58
    elif test_frame == 1408:
        frame_incr = -8
    elif test_frame == 1390:
        frame_incr = 10
    else:
        frame_incr = 40
    frame_for_logname = str(test_frame + frame_incr)
    return frame_for_logname

