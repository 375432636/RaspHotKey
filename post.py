import requests,json

def urlpost(data):
    url = 'http://10.3.141.96:8888/keyboard'
    try:
        r = requests.post(url,data=json.dumps(data),timeout=5)
    except requests.exceptions.ConnectTimeout:
        print('timeout')
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

