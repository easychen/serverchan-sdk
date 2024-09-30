import 'package:serverchan_sdk/serverchan_sdk.dart';

void main() async {
  const sendkey = 'your-sendkey';
  const title = 'Hello, Server Chan!';
  const desp = 'This is a test message from Dart SDK.';

  // 可选参数
  ScSendOptions options = ScSendOptions(
    tags: 'test,serverchan',
    shortDesc: 'Test Message',
    noip: 1,
  );

  try {
    ScSendResponse response =
        await scSend(sendkey, title, desp: desp, options: options);
    print('Response Code: ${response.code}');
    print('Response Message: ${response.message}');
    if (response.data != null) {
      print('Response Data: ${response.data}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
