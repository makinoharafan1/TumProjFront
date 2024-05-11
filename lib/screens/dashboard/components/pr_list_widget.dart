import 'package:flutter/material.dart';
import 'package:puble_frontend/data/pr_data.dart';
import 'package:puble_frontend/screens/dashboard/components/pr_list_element.dart';

class PullRequestsList extends StatefulWidget {
  const PullRequestsList({super.key});

  @override
  State<PullRequestsList> createState() => _PullRequestsListState();
}

class _PullRequestsListState extends State<PullRequestsList> {
  final data = PullRequestData();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.data.length,
      itemBuilder: (context, index) => 
        PullRequestElement(pr: data.data[index])
      ,
    );
  }
}
