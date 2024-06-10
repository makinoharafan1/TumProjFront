import 'package:puble_frontend/data/pr_data.dart';

class PullRequestModel {
  late int labNumber;
  late String studentName;
  late String group;
  late DateTime date;
  late int numOfPassedLabs;
  late int numOfRepasses;
  late String studentId;
  late String prId;
  late String prLink;

  PullRequestModel({
    required this.studentId,
    required this.prId,
    required this.labNumber,
    required this.group,
    required this.studentName,
    required this.date,
    required this.numOfPassedLabs,
    required this.numOfRepasses,
    required this.prLink,
  });
  PullRequestModel.fromJson(Map json) {
    labNumber = json['labNumber'];
    studentName = json['studentName'];
    group = json['group'];
    date = DateTime.parse(json['date']);
    numOfPassedLabs = json['numOfPassedLabs'];
    numOfRepasses = json['numOfRepasses'];
    studentId = json['studentId'];
    prId = json['prId'];
    prLink = json['prLink'];
  }
}
