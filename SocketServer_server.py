import socketserver
import win32api, win32con
import json,time

def key_even( input_key):
    win32api.keybd_event(input_key,0, 0, 0)
    time.sleep(0.01)
    win32api.keybd_event(input_key,0, win32con.KEYEVENTF_KEYUP, 0)
    #time.sleep(0.01)

def PressKey(data):
    dataDic = json.loads(data)
    #dataDic = json.loads(dataDic)
    if dataDic['value'] == 0:
        with open(r"./keypressed.txt","wb") as f:
            f.write(("%04d"%(int(dataDic['code']))).encode('utf-8'))
        key_even(135+dataDic['device'])

class MyTCPHandler(socketserver.BaseRequestHandler):
    """
　　 客户端发送a-z字符串，socketserver返回大写
    """
    def handle(self):    #必须要有handle方法；所有处理必须通过handle方法实现
        # self.request is the TCP socket connected to the client
        while True:
            self.data = self.request.recv(1024).strip()
            if not self.data:
                print('The client disconnects actively!')
                break
            self.return_client()

    def return_client(self):    #数据处理方法
        print("Ip:{0} Port{1}:".format(self.client_address[0], self.client_address[1]))
        print(self.data.decode('utf8'))
        # just send back the same data, but upper-cased
        self.request.sendall(self.data)
        PressKey(self.data.decode('utf8'))


if __name__ == "__main__":
    HOST, PORT = "0.0.0.0", 8009

    # Create the server, binding to localhost on port 9999
    server = socketserver.ThreadingTCPServer((HOST, PORT), MyTCPHandler)    #实例化一个多线程TCPServer
    print('Wait client . . .') 
    server.serve_forever()