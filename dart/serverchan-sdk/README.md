# serverchan-sdk

`serverchan-sdk` 是一个用于调用 Server 酱推送服务的 Dart SDK。该 SDK 允许你通过简单的接口将消息发送到 Server 酱，并支持可选的自定义参数。

## 功能

- 支持 Server 酱 `SendKey` 推送
- 支持自定义消息内容、描述、频道等选项
- 支持 API 请求结果的解析

## 安装

在 `pubspec.yaml` 文件中添加依赖项：

```yaml
dependencies:
  http: ^0.13.0
  serverchan_sdk:
    path: ./serverchan_sdk
```

然后运行以下命令：

```bash
dart pub get
```

## 使用方法

### 简单示例

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

### 带有可选参数的示例

```dart
import 'package:serverchan_sdk/serverchan_sdk.dart';

void main() async {
  const sendkey = 'your-sendkey';
  const title = '带选项的测试标题';
  const desp = '这是带选项的消息内容';

  ScSendOptions options = ScSendOptions(
    tags: '测试,标签',
    shortDesc: '简短描述',
    noip: 1,
  );

  try {
    ScSendResponse response = await scSend(sendkey, title, desp: desp, options: options);
    print('Response Code: ${response.code}');
    print('Response Message: ${response.message}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## API 参考

### `scSend`

```dart
Future<ScSendResponse> scSend(String sendkey, String title, {String desp = '', ScSendOptions? options})
```

发送消息到 Server 酱。

- `sendkey`：Server 酱的 SendKey，用于认证推送。
- `title`：消息的标题。
- `desp`（可选）：消息的详细内容，默认为空字符串。
- `options`（可选）：一个 `ScSendOptions` 对象，包含推送的可选参数。

返回一个 `Future<ScSendResponse>`，其中包含推送请求的结果。

### `ScSendOptions`

可选的推送参数，包含以下字段：

- `tags`：消息的标签。
- `shortDesc`：简短的描述。
- `noip`：是否不显示 IP 地址（1 表示不显示）。
- `channel`：自定义推送频道。
- `openid`：指定的用户 OpenID。

### `ScSendResponse`

响应对象，包含以下字段：

- `code`：API 返回的状态码。
- `message`：API 返回的消息。
- `data`：API 返回的数据（如果有的话）。

## 错误处理

在请求过程中可能会抛出异常，因此建议使用 `try-catch` 进行异常处理。

```dart
try {
  // 发送推送请求
} catch (e) {
  print('Error: $e');
}
```

## 许可

该项目遵循 MIT 许可协议。