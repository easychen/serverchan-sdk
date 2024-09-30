# ServerChan-SDK

`serverchan-sdk` 是一个用于通过 ServerChan (方糖) 推送消息的 Python SDK。该 SDK 提供了简洁的 API，使开发者能够轻松地通过 ServerChan 向微信发送消息通知。

## 安装

使用 `pip` 进行安装:

```bash
pip install serverchan-sdk
```

## 使用方法

### 导入库并发送消息

首先导入 `serverchan-sdk` 并调用 `sc_send` 函数发送消息。

```python
from serverchan_sdk import sc_send

# 发送消息
sendkey = "your_sendkey"
title = "测试标题"
desp = "这是消息内容"
options = {"template": "markdown"}  # 可选参数

response = sc_send(sendkey, title, desp, options)

# 输出响应
print(response)
```

### 参数说明

- `sendkey`: 必填，您的 ServerChan SendKey。SendKey 是方糖推送消息的唯一标识，可以从方糖的管理后台获取。
- `title`: 必填，消息的标题。
- `desp`: 可选，消息的具体内容，默认为空字符串。
- `options`: 可选，字典类型，用于传递额外的参数，比如消息模板、提醒选项等。默认为 `None`。

### 选项说明
`options` 字典中可以包括的选项，例如：

- `template`: 用于定义消息格式。可以选择 `"html"`, `"markdown"` 等。
- 其他 ServerChan 支持的参数也可以通过 `options` 传入。

### 返回值
`sc_send` 函数返回一个字典，包含 ServerChan API 的响应结果。可以通过这个结果检查消息发送是否成功。

## 示例

```python
from serverchan_sdk import sc_send

sendkey = "your_sendkey"
title = "系统报警"
desp = "服务器 CPU 使用率过高，请立即检查。"
response = sc_send(sendkey, title, desp)

if response.get("code") == 0:
    print("消息发送成功！")
else:
    print(f"消息发送失败：{response.get('message')}")
```

### 支持的推送服务

- 如果 `sendkey` 以 `sctp` 开头，SDK 将使用 `https://{sendkey}.push.ft07.com/send` 地址推送消息。
- 否则，将默认使用 `https://sctapi.ftqq.com/{sendkey}.send` 进行推送。

## 依赖

该 SDK 使用了以下 Python 包：

- `requests`: 用于发送 HTTP 请求。

安装依赖包：

```bash
pip install requests
```

## License

本项目遵循 MIT License 开源协议。

---

这样您就可以通过简单的函数调用，利用 ServerChan 实现消息推送通知了。