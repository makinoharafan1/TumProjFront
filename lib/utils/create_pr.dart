import 'package:puble_frontend/const/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:puble_frontend/variables/variables.dart';

Future<bool> createPR({
  required String link,
  required String comment,
}) async {
  var x = Uri.parse('${host}create_pull_request');
  var mg = jsonEncode({
    'auth_key': authKey,
    'pull_link': link,
    'comment': comment,
  });

  final response = await http.post(
    x,
    headers: {'Content-Type': 'application/json'},
    body: mg,
  );
  final body = json.decode(response.body);
  return body['res'];
}
