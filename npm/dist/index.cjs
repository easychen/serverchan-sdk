"use strict";var a=require("cross-fetch");async function r(t,s,e="",n={}){const c=String(t).startsWith("sctp")?`https://${t}.push.ft07.com/send`:`https://sctapi.ftqq.com/${t}.send`,i={title:s,desp:e,...n};return await(await a(c,{method:"POST",headers:{"Content-Type":"application/json;charset=utf-8"},body:JSON.stringify(i)})).json()}exports.scSend=r;
