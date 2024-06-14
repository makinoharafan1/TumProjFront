import 'package:puble_frontend/models/pr_model.dart';

class PullRequestsListModel {
  final List<PullRequestModel> list;
  late bool isLoading;
  PullRequestsListModel({
    required this.list,
    this.isLoading = true,
  });
}
