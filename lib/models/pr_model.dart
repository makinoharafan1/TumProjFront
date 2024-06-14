class PullRequestModel {
  final int labNumber;
  final String studentName;
  final String group;
  final DateTime date;
  final int numOfPassedLabs;
  final int numOfRepasses;
  final String studentId;
  final String prId;
  final String prLink;

  const PullRequestModel({
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
}
