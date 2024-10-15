# -*- coding: utf-8 -*-
from serverchan_sdk import sc_send

# 发送消息
sendkey = "..."
title = "py sdk测试"
desp = "这是来自py sdk的消息内容"
options = {"template": "markdown"}  # 可选参数

response = sc_send(sendkey, title, desp, options)

# 输出响应
print(response)