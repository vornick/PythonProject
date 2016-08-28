
import json

conf_file = open('config.json')
stream = conf_file.read()
json_config = json.loads(stream)

Ixia_settings_of_client = json_config['physical_Settings_Client']
Ixia_settings_of_server = json_config['physical_Settings_Server']
# frame_size = json_config['?FrameResult?']
ports_client = Ixia_settings_of_client['?PortIdClient?']
#    if ports [:7] == "?PortId":
print(ports_client)

for all_set in Ixia_settings_of_client:
    if all_set[:1] == "?":
        x = Ixia_settings_of_client[all_set]
        print(x)



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
