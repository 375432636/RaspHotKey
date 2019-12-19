from socket import *

class soc():
    def __init__(self):
        self.flag = False
    def MakeConnect(self):
        ipaddr = '10.3.141.56'
        port = 8009
        try:
            self.tcp_client = socket(AF_INET,SOCK_STREAM)
            self.tcp_client.connect((ipaddr, port))
            self.flag = True
        except ConnectionRefusedError:
            self.flag = False

    def SendMessage(self):
        try:
            self.tcp_client.send(self.message.encode("utf-8"))
            data = self.tcp_client.recv(1024)
            print("data is %s" %data.decode("utf-8"))
        except ConnectionRefusedError:
            self.flag = False
    def TryToSend(self,message):
        self.message = message
        if self.flag:
            self.SendMessage()
        else:
            self.MakeConnect()
            self.SendMessage()

if __name__ == '__main__':
    connector = soc()
    for i in range(10):
        connector.TryToSend("1")
