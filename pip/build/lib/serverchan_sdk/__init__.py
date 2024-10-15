import requests
import re

def sc_send(sendkey, title, desp='', options=None):
    if options is None:
        options = {}
    if sendkey.startswith('sctp'):
        match = re.match(r'^sctp(\d+)t', sendkey)
        if match:
            url = f'https://{match.group(1)}.push.ft07.com/send/{sendkey}.send'
        else:
            raise ValueError("Invalid sendkey format for 'sctp'.")
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
