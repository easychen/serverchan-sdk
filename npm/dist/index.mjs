import a from"cross-fetch";async function c(t,s,n="",e={}){const o=String(t).startsWith("sctp")?`https://${t}.push.ft07.com/send`:`https://sctapi.ftqq.com/${t}.send`,i={title:s,desp:n,...e};return await(await a(o,{method:"POST",headers:{"Content-Type":"application/json;charset=utf-8"},body:JSON.stringify(i)})).json()}export{c as scSend};
