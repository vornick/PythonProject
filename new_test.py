# -*- coding: utf8 -*-
import json, os

<<<<<<< HEAD
num_of_platform = TypeChoice = "$Network1 portList.appendItem \\ \n" + \
                                "       - chassisId 1 \\ \n" + \
                                "       - cardId 1 \\ \n" + \
                                "       - portId 1 \n" + \
                                "\n"

print(num_of_platform)

# folder_template_file = 'templates'
#
# Template_File = "L3_Template_ConcurentС.txt"
#
#
# def template_check(Template_File, folder_template_file):
#     for filename in os.listdir(folder_template_file):
#         with open(os.path.join(folder_template_file, Template_File), "r") as f:
#             # EndFile = open(os.path.join(folder_template_file, Template_File)).read()
#             check = 0
#             linenum = 0
#             lists = []
#             for lines in f:
#                 linenum += 1
#                 for wordr in lines.split():
#                     for chara in wordr:
#                         if chara == "?":
#                             check += 1
#                             numofline = lists.append(linenum)
#
#                             break
#
#     print("In Test file " + str(check) + " template words " + wordr + " on lines", lists)
#     f.close()
# # line_parser(frame, folder, all_tests, num_of_platform, File, SourceFile)
#
# template_check(Template_File, folder_template_file)
=======
folder_template_file = 'templates'

Template_File = "L3_Template_Throughput.txt"


def template_check(Template_File, folder_template_file):
    for filename in os.listdir(folder_template_file):
        with open(os.path.join(folder_template_file, Template_File), "r") as f:
            # EndFile = open(os.path.join(folder_template_file, Template_File)).read()
            check = 0
            linenum = 0
            lists = []
            for lines in f:
                linenum += 1
                for wordr in lines.split():
                    for chara in wordr:
                        if chara == "?":
                            check += 1
                            numofline = lists.append(linenum)

                            break

    print("In Test file " + str(check) + " template words " + wordr + " on lines", lists)
    f.close()
# line_parser(frame, folder, all_tests, num_of_platform, File, SourceFile)

template_check(Template_File, folder_template_file)
>>>>>>> ff64fec240fb0c944921886bfef4a67170402f70
