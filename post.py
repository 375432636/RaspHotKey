import requests,json

def urlpost(data):
    url = 'http://10.3.141.56:8888/keyboard'
    try:
        r = requests.post(url,data=json.dumps(data),timeout=5)
    except requests.exceptions.ConnectTimeout:
        print('timeout')
    except requests.exceptions.ConnectionError:
        print('no open the manager')
    #print(r.json()) 

if __name__ == '__main__':
    data = {
           'id':1,
           'name':'lily',
           'age':11,
           'birthplace':'san',
           'grade':123
           }
    urlpost(data)

