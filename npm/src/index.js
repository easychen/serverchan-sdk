import fetch from 'cross-fetch';

// 调用 Server 酱的推送函数
export async function scSend(sendkey, title, desp = '', options = {}) {
    
    const url = String(sendkey).startsWith('sctp') 
        ? `https://${sendkey.match(/^sctp(\d+)t/)[1]}.push.ft07.com/send/${sendkey}.send`
        : `https://sctapi.ftqq.com/${sendkey}.send`;
    
    const params = {
        title,
        desp,
        ...options,
    };

    const response = await fetch(url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json;charset=utf-8',
        },
        body: JSON.stringify(params),
    });

    const result = await response.json();
    return result;
}
