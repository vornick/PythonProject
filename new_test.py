# -*- coding: utf8 -*-

import json
# word = "hai"
# word2 = '"hai"'
#
# # if word == word2 or word2 == str('"' + word + '"'):
# print(word2[1:-1])
# "?FrameResult?": {
#     "frame_size": "1460",
#     "short_CGW_Frames": "216, 1240, 1460",
#     "short_L2_Frames": "198, 1222, 1460",
#     "long_CGW_MCE": "216, 472, 984, 1240, 1460",
#     "long_L3": "216, 472, 984, 1240, 1460, 1408",
#     "long_L2": "198, 454, 966, 1222, 1460, 1390"



num_of_platform = "ipc-10"
all_tests = "Standart"
folder = "1518"
frame = "1460"
Template = "L3_Template_Throughput.txt"
SourceFile = open(Template, 'r')
File = 'RunFile.tcl'
conf_file = open('standart_config.json')
stream = conf_file.read()
json_config = json.loads(stream)
Ixia_settings = json_config['settings']
frame_size = json_config['?FrameResult?']



def line_parser(frame, folder, all_tests, num_of_platform, File, SourceFile):
    EndFile = open(File, 'w')
    global result_directory
    result_directory = ""
    for line in SourceFile:
        count = 0
        for word in line.split():
            for all_set in Ixia_settings:
                if word == '"?ResultDir?"':
                    x = Ixia_settings[word]
                    list_of_result = []
                    result_directory = x + r'\%s\%s\%s' % (num_of_platform, all_tests, folder) #доставить слеши
                    print(result_directory)
                    for splitchar in result_directory:
                        if splitchar == "\\":
                            splitchar = splitchar + '\\'
                        list_of_result.append(splitchar)
                    doubleslash_result_directory = '"%s"' % (''.join(list_of_result))
                    print(result_directory, doubleslash_result_directory)
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
                EndFile.write(line.replace(word, frame))
                count = 1
                continue
            if word == '"?NameResult?"':
                EndFile.write(line.replace(word, folder))
                count = 1
                continue
        if count == 0:
            EndFile.write(line)
    EndFile.close()
    SourceFile.close()
    template_check(File)

    # else:
    #     test_check_and_run(result_directory, EndFile, frame)
                        # if concurent_connectuion_test == "default"
                        #     print ("Propyskaem Test")
                        # else:

def template_check(File):
    EndFile = open(File, 'r')
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

    print("In Test file " + str(check) + " template words " + wordr + " on lines", lists)
    EndFile.close()
line_parser(frame, folder, all_tests, num_of_platform, File, SourceFile)

