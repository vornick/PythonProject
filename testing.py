import json, re, glob
#
#
# global directory
# directory = "C:\\Result\\TCP"
# conf_file = open('standart_config.json')
# stream = conf_file.read()
# json_config = json.loads(stream)
#
# Ixia_settings = json_config['test_cases']
# word = "?ResultDir?"
#
#
#
# def line_parser(Ixia_settings, word):
#     num_of_platform = "\\IPC-3000"
#     list_of_result = []
#     for all_set in Ixia_settings.split(","):
#
#         print(all_set)
#
#             # result_directory = str(list_of_result)
#             # result_directory = re.sub(r",", result_directory, '1')
#
#         print(''.join(list_of_result))
#     # pars_directory = re.sub(r"\\", result_directory, '\\')
#     # print(pars_directory)
#
#
#
#
# line_parser(Ixia_settings, word)

conf_file = open('standart_config.json')
stream = conf_file.read()
json_config = json.loads(stream)
Ixia_settings = json_config['settings']
test_cases = json_config['test_cases']
Runnuble_tcl_file = 'RunFile.tcl'
specific_test = test_cases['specific']
TypeChoice = "short_L3"


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


    print(template_list)


template_choose(TypeChoice, specific_test)