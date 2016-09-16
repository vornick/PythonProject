import json

num_of_test_frame = "default"

def frame(num_of_test_frame):
    conf_file = open('standart_config.json')
    stream = conf_file.read()
    json_config = json.loads(stream)
    frame_size = json_config['?FrameResult?']
    for all_frame in frame_size:
        if all_frame == num_of_test_frame:
            x = frame_size[all_frame]
            print(x)
            return x
frame(num_of_test_frame)