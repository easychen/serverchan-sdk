# serverchan-sdk

Server酱SDK

这个sdk很简单，只有一个函数。同时支持 sct.ftqq.com 和 sc3.ft07.com, 也就是说，用它你就无需关系用户用的是哪个版本，它会从key中自动适配。
所有语言的参数均为：

1. sendkey
2. title
3. desp - 消息内容，支持markdown，可以外链图片（请使用https）。
4. options - 其他更多选项

更多选项包括以下：

```jsonc
{
    /** SC3专用：标签列表，多个标签使用竖线分隔 */
    tags?: string;
    /** SC3和SCT：消息卡片的简短描述 */
    short?: string;
    /** SCT：是否隐藏调用IP，1为隐藏 */
    noip?: 1;
    /** SCT：推送使用的消息通道，多个通道值用竖线隔开 */
    channel?: string;
    /** SCT：消息抄送的 openid，多个 openid 用逗号或竖线分隔 */
    openid?: string;
}
```

返回格式定义：

```json
{
    code: number;/** 返回的状态码, 0 为正确 */
    message: string;/** 返回的信息，和状态码对应 */
    data?: any; /** 可选的返回数据，SCT和SC3这部分格式不同 */
}
```
以下是各个语言的SDK及其用法，点击查看详细

<details>
<summary>JavaScript SDK ( Both web & nodejs )</summary>

### SDK 地址
- npm : <https://www.npmjs.com/package/serverchan-sdk>


### 安装

```bash
npm install serverchan-sdk
```

### 调用实例

```js
const sendkey = '...'; // 替换成真实的 Server 酱 sendkey
const title = 'Test Notification';
const desp = 'This is a test message';

const response = await scSend(sendkey, title, desp, { tags: '服务器报警|报告' });
console.log('Response:', response);
```
</details>


<details>
<summary>PHP SDK</summary>

### SDK 地址
- compose package : <https://packagist.org/packages/easychen/serverchan-sdk>


### 安装

```bash
composer require easychen/serverchan-sdk
```

### 调用实例

```php
$ret = scSend('sendkey', 'title', 'desp', ['tags'=>'服务器报警|图片']);
print_r($ret);
```
</details>

<details>
<summary>Python SDK</summary>

### SDK 地址
- pip package : <https://pypi.org/project/serverchan-sdk/>


### 安装

```bash
pip install serverchan-sdk
```

### 调用实例

```python
from serverchan_sdk import sc_send

# 发送消息
sendkey = "..."
title = "测试标题"
desp = "这是消息内容"
options = {"tags": "服务器报警|图片"}  # 可选参数

response = sc_send(sendkey, title, desp, options)
```
</details>

<details>
<summary>Golang SDK</summary>

### SDK 地址
- <https://github.com/easychen/serverchan-sdk-golang>


### 安装

```bash
go get github.com/easychen/serverchan-sdk-golang
```

### 调用实例

```go
package main

import (
    "fmt"
    "github.com/easychen/serverchan-sdk-golang"
)

func main() {
    sendkey := "your-sendkey"
    title := "Test Message"
    desp := "This is a test message"
    
    resp, err := serverchan_sdk.ScSend(sendkey, title, desp, nil)
    if err != nil {
        fmt.Println("Error:", err)
    } else {
        fmt.Println("Response:", resp)
    }
}
```
</details>

<details>
<summary>Dart/Flutter SDK</summary>

### SDK 地址
Pub Package - <https://pub.dev/packages/serverchan_sdk>

> 此 package 依赖 http 包

### 安装

在 `pubspec.yaml` 添加依赖 

```
dependencies:
    serverchan_sdk:
```
然后运行

```bash
dart pub get 
# 或者
flutter pub get
```

### 调用实例

```dart
import 'package:serverchan_sdk/serverchan_sdk.dart';

void main() async {
  const sendkey = 'your-sendkey';
  const title = '测试标题';
  const desp = '这是消息的详细内容';

  try {
    ScSendResponse response = await scSend(sendkey, title, desp: desp);
    print('Response Code: ${response.code}');
    print('Response Message: ${response.message}');
  } catch (e) {
    print('Error: $e');
  }
}
```
</details>



