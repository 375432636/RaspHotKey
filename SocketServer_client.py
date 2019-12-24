from socket import *
import json 
import logging


class soc():
    def __init__(self):
        self.flag = False
        self.logging = logging
        self.logging.basicConfig(level=logging.DEBUG)
    def MakeConnect(self):
        ipaddr = '192.168.1.101'
        port = 8009
        try:
            self.tcp_client = socket(AF_INET,SOCK_STREAM)
            self.tcp_client.connect((ipaddr, port))
            self.flag = True
        except (error,timeout,OSError) as e:
            self.logging.error(e)
            self.flag = False

    def SendMessage(self):
        try:
            self.tcp_client.send(self.message.encode("utf-8"))
            data = self.tcp_client.recv(1024)
            self.logging.debug("data is %s" %data.decode("utf-8"))
        except (error,timeout,OSError) as e:
            self.logging.error(e)
            self.flag = False

    def TryToSend(self,message):
        self.message = json.dumps(message)
        if self.flag:
            self.SendMessage()
        else:
            self.MakeConnect()
            self.SendMessage()

if __name__ == '__main__':
    connector = soc()
    data = {"type": 1, "value": 0, "code": 107, "device": 0}
    #data = json.dumps(data)
    from datetime import datetime 
    a=datetime.now() 
    for i in range(10):
        connector.TryToSend(data)
    b=datetime.now() 
    print((b-a).microseconds)
