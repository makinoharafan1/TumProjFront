import 'package:puble_frontend/const/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> registerStudent({
  required String logging,
  required String password,
  required String teacher,
}) async {
  var x = Uri.parse('${host}create_student');
  var mg = jsonEncode({
    'login': logging,
    'password': password,
    'teacher': teacher,
  });

  await http.post(
    x,
    headers: {'Content-Type': 'application/json'},
    body: mg,
  );
  // final body = json.decode(response.body);
  // return body['auth_key'];
}
