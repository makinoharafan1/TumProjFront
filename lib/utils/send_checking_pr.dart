import 'dart:convert';

import 'package:puble_frontend/const/constant.dart';
import 'package:http/http.dart' as http;

Future<void> sendCheckingPR(
    {required String authKey, required String prLink}) async {
  final link = Uri.parse('${host}send_checked_pr_to_check');
  final mg = jsonEncode({'auth_key': authKey, 'pr_link': prLink});
  await http.post(
    link,
    headers: {'Content-Type': 'application/json'},
    body: mg,
  );
  // final body = json.decode(response.body);
  // return body['changes'];
}
