import 'dart:convert';

import 'package:puble_frontend/const/constant.dart';
import 'package:http/http.dart' as http;

Future<bool> checkPRCheck({required String authKey}) async {
  final link = Uri.parse('${host}check_is_previous_pr_checked');
  final mg = jsonEncode({
    'auth_key': authKey,
  });
  final response = await http.post(
    link,
    headers: {'Content-Type': 'application/json'},
    body: mg,
  );
  final body = json.decode(response.body);
  return body['changes'];
}
