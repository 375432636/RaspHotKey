import flask
import json
import win32api, win32con
import time
 
# 创建接口服务，其中(__name__)指当前的python文件，也就是说接口是基于此文档在运行
server = flask.Flask(__name__)
def key_even( input_key):
    win32api.keybd_event(input_key,0, 0, 0)
    time.sleep(0.01)
    win32api.keybd_event(input_key,0, win32con.KEYEVENTF_KEYUP, 0)
    time.sleep(0.3)
# 装饰器route指定路径以及请求方式(默认GET)
@ server.route('/keyboard', methods=['GET', 'POST'])
def test_post():
    # request.method是获得请求方法
    dataAll = flask.request.data.decode('utf-8')
    print('data',dataAll)
    if flask.request.method == 'POST':
 
        #print(flask.request.json)
        data = flask.request.data.decode('utf-8')
        data = json.loads(data)
        #print(data)
        #data = json.loads(data)
        print(data)
        if data['value'] == 0:
            with open(r"C:\AHK\2nd-keyboard\LUAMACROS\keypressed.txt","wb") as f:
                f.write(("%04d"%(int(data['code']))).encode('utf-8'))
            key_even(135+data['device'])
  
    elif flask.request.method == 'GET':
 
        # 获得GET请求，使用flask.request.args.get('xxx')
        name = flask.request.args.get('name')
 
    else:
        # 同时获得GET与POST请求，使用flask.request.values.get('xxx')
        name = flask.request.values.get('name')
 
    return json.dumps(dataAll, ensure_ascii=False)

server.run(host='0.0.0.0',port=8888, debug=True)