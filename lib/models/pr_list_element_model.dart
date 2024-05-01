class PullRequestElementModel {
  final int labaIndex;
  final String studentName;
  final DateTime date;
  final int numOfPassedLabs;
  final int numOfRepasses;
  final String studentId;
  final String prId;
  const PullRequestElementModel({
    required this.studentId,
    required this.prId,
    required this.labaIndex,
    required this.studentName,
    required this.date,
    required this.numOfPassedLabs,
    required this.numOfRepasses,
  });
}
