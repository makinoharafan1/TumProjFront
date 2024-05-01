import 'package:tum_proj/models/pr_list_element_model.dart';

class PullRequestsListModel {
  final List<PullRequestElementModel> list;
  late bool isLoading;
  PullRequestsListModel({
    required this.list,
    this.isLoading = true,
  });
}
