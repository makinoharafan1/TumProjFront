import 'package:puble_frontend/const/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:puble_frontend/variables/variables.dart';

Future<bool> getAuthKey({
  required String logging,
  required String password,
}) async {
  var x = Uri.parse('${host}get_auth_key');
  var mg = jsonEncode({
    'login': logging,
    'password': password,
  });

  final response = await http.post(
    x,
    headers: {'Content-Type': 'application/json'},
    body: mg,
  );
  final body = json.decode(response.body);
  if (body['success']) {
    authKey = body['auth_key'];
    userType = body['user_type'];
  }
  return body['success'];
}
