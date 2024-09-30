import 'dart:convert';
import 'package:http/http.dart' as http;

class ScSendOptions {
  String? tags;
  String? shortDesc;
  int? noip;
  String? channel;
  String? openid;

  ScSendOptions(
      {this.tags, this.shortDesc, this.noip, this.channel, this.openid});

  Map<String, dynamic> toJson() {
    return {
      if (tags != null) 'tags': tags,
      if (shortDesc != null) 'short': shortDesc,
      if (noip != null) 'noip': noip,
      if (channel != null) 'channel': channel,
      if (openid != null) 'openid': openid,
    };
  }
}

class ScSendResponse {
  int code;
  String message;
  dynamic data;

  ScSendResponse({required this.code, required this.message, this.data});

  factory ScSendResponse.fromJson(Map<String, dynamic> json) {
    return ScSendResponse(
      code: json['code'],
      message: json['message'],
      data: json['data'],
    );
  }
}

Future<ScSendResponse> scSend(
  String sendkey,
  String title, {
  String desp = '',
  ScSendOptions? options,
  http.Client? client, // 新增参数
}) async {
  // 使用传入的 client 或默认的 http.Client()
  client ??= http.Client();

  String url;
  if (sendkey.startsWith('sctp')) {
    url = 'https://$sendkey.push.ft07.com/send';
  } else {
    url = 'https://sctapi.ftqq.com/$sendkey.send';
  }

  Map<String, dynamic> params = {
    'title': title,
    'desp': desp,
    if (options != null) ...options.toJson(),
  };

  final response = await client.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json;charset=utf-8'},
    body: jsonEncode(params),
  );

  final result = jsonDecode(response.body);
  return ScSendResponse.fromJson(result);
}
