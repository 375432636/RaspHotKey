from evdev import InputDevice
from select import select
import SocketServer_client
import logging
#level = logging.DEBUG
level = logging.INFO
#level = logging.ERROR

logging.basicConfig(level=level)


class key():
    def __init__(self):
        self.device = 0
        self.holdkey = 0
        self.list = []
        self.status = True
        self.connetor = SocketServer_client.soc()
        self.connetor.logging.basicConfig(level=level)

    def down(self):
        if self.holdkey == 0:
            self.holdkey = self.key
            self.list = [self.key]
        elif self.holdkey != 0 and self.holdkey != self.key:
            self.list.append(self.key)
    def up(self):
        if self.holdkey != 0 and self.holdkey == self.key:
            self.holdkey = 0
            data = dict(zip(('type','value','code'),(self.type,self.value,self.key)))
            data['device'] = self.device
            if len(self.list) == 1:
                pass
            else:
                self.list.append(10)
                #print(self.list)
                data['code'] = (''.join(["%02d"%(i) for i in self.list]))
                #print(data)
                self.hot_key(data['code'])

            if self.status == True:
                # 如果没有status = True，才执行上传
                self.connetor.TryToSend(data)

    def exam(self,event):
        if event.code != 0 and event.value < 10000:
                logging.debug("type:%s,value:%s,code:%s"%(event.type,event.value,event.code))
                self.key = event.code
                self.type = event.type
                self.value= event.value
                if event.value == 1:
                    self.down()
                elif event.value == 0 :
                    self.up()
        
    def hot_key(self,data):
        if data  == '290110':
            self.status = False
        elif data  == '29010110':
            self.status = True
a = key()
def detectInputKey(count):
    dev = InputDevice('/dev/input/event%s'%a.device)
    logging.info(dev)
    while True:
        select([dev], [], [])
        for event in dev.read():
            #print("value:%s,code:%s"%(event.value,event.code))
            #if event.code != 0 and event.value != 2 and event.value < 10000:
            a.exam(event)
                

detectInputKey(0)
