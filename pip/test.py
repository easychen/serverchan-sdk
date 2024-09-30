# -*- coding: utf-8 -*-
from serverchan_sdk import sc_send

# 发送消息
sendkey = "..."
title = "测试标题"
desp = "这是消息内容"
options = {"template": "markdown"}  # 可选参数

response = sc_send(sendkey, title, desp, options)

# 输出响应
print(response)