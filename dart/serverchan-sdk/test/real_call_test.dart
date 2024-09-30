import 'package:serverchan_sdk/serverchan_sdk.dart';
import 'package:test/test.dart';

void main() {
  // Replace this with your actual SendKey
  const sendkey = 'sctp4'; // 必须是有效的 sendkey

  group('Real API Call', () {
    test(
        'scSend should send a message to ServerChan and return a valid response',
        () async {
      if (sendkey == 'your-sendkey') {
        fail('You must set a real SendKey to run this test.');
      }

      const title = 'Test from Dart SDK';
      const desp = 'This is a test message sent from a Dart test.';

      try {
        // Send an actual message
        ScSendResponse response = await scSend(sendkey, title, desp: desp);

        // Check that the response indicates success (Server 酱 API uses code 0 for success)
        expect(response.code, 0);
        print('Response message: ${response.message}');
      } catch (e) {
        fail('Failed to send message: $e');
      }
    });
  });
}
