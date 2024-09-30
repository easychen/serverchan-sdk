import requests

def sc_send(sendkey, title, desp='', options=None):
    if options is None:
        options = {}
    if sendkey.startswith('sctp'):
        url = f'https://{sendkey}.push.ft07.com/send'
    else:
        url = f'https://sctapi.ftqq.com/{sendkey}.send'
    params = {
        'title': title,
        'desp': desp,
        **options
    }
    headers = {
        'Content-Type': 'application/json;charset=utf-8'
    }
    response = requests.post(url, json=params, headers=headers)
    result = response.json()
    return result
