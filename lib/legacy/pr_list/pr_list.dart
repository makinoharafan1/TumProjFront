import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tum_proj/model/pr_list_model.dart';
import 'package:tum_proj/legacy/pr_list/pr_list_element.dart';

class PullRequestsList extends StatefulWidget {
  const PullRequestsList({super.key});

  @override
  State<PullRequestsList> createState() => _PullRequestsListState();
}

class _PullRequestsListState extends State<PullRequestsList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PullRequestsListModel>(
      builder: (context, model, widget) => model.isLoading
          ? const CircularProgressIndicator()
          : ListView.builder(
              itemCount: model.list.length,
              itemBuilder: (context, index) =>
                  PullRequestElement(pr: model.list[index]),
            ),
    );
  }
}
