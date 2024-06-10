import 'dart:convert';

import 'package:puble_frontend/const/constant.dart';
import 'package:http/http.dart' as http;
import 'package:puble_frontend/models/pr_model.dart';

Future<List<PullRequestModel>> getListOfPR({required String authKey}) async {
  final link = Uri.parse('${host}get_pr_by_teacher?teacher_id=$authKey');
  final response = await http.get(
    link,
    headers: {'Content-Type': 'application/json'},
  );
  final body = json.decode(utf8.decode(response.bodyBytes));
  final List prl = body['data'];
  final d = List.generate(prl.length, (i) => PullRequestModel.fromJson(prl[i]));
  return d;
}
