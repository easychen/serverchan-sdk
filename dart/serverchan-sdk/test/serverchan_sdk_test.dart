import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:serverchan_sdk/serverchan_sdk.dart';
import 'package:test/test.dart';

void main() {
  group('ScSendOptions', () {
    test('toJson should return correct JSON map', () {
      ScSendOptions options = ScSendOptions(
        tags: 'test,tag',
        shortDesc: 'This is a short description',
        noip: 1,
        channel: 'email',
        openid: 'open123',
      );

      expect(options.toJson(), {
        'tags': 'test,tag',
        'short': 'This is a short description',
        'noip': 1,
        'channel': 'email',
        'openid': 'open123',
      });
    });
  });

  group('ScSendResponse', () {
    test('fromJson should parse JSON correctly', () {
      Map<String, dynamic> jsonResponse = {
        'code': 0,
        'message': 'success',
        'data': null,
      };

      ScSendResponse response = ScSendResponse.fromJson(jsonResponse);

      expect(response.code, 0);
      expect(response.message, 'success');
      expect(response.data, null);
    });
  });

  group('scSend API function', () {
    test('scSend should make a POST request and return ScSendResponse',
        () async {
      // Use MockClient to simulate the HTTP response
      final mockClient = MockClient((http.Request request) async {
        // Simulate a successful response from the server
        return http.Response(
          jsonEncode({
            'code': 0,
            'message': 'success',
            'data': null,
          }),
          200,
          headers: {'Content-Type': 'application/json'},
        );
      });

      // Replace the real http.post with the mock client
      const sendkey = 'test-sendkey';
      const title = 'Test Title';
      const desp = 'This is a test message.';

      ScSendOptions options = ScSendOptions(
        tags: 'test',
        shortDesc: 'Test short desc',
        noip: 1,
      );

      // Use mockClient for the http post request within the scSend function
      final response = await scSend(sendkey, title,
          desp: desp, options: options, client: mockClient);

      print(response);
      // Verify the result
      expect(response.code, 0);
      expect(response.message, 'success');
    });
  });
}
