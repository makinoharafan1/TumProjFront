import 'package:flutter/material.dart';
import 'package:tum_proj/models/pr_list_element_model.dart';
import 'package:tum_proj/view/pr_page/pr_page.dart';

class PullRequestElement extends StatelessWidget {
  final PullRequestElementModel pr;
  const PullRequestElement({super.key, required this.pr});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PullRequestPage(pr: pr),
            ),
          );
        },
        icon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                pr.labaIndex.toString(),
                style: const TextStyle(overflow: TextOverflow.fade),
              ),
              Text(
                pr.studentName.toString(),
                style: const TextStyle(overflow: TextOverflow.fade),
              ),
              Text(
                pr.date.toString(),
                style: const TextStyle(overflow: TextOverflow.fade),
              ),
              Text(
                pr.numOfPassedLabs.toString(),
                style: const TextStyle(overflow: TextOverflow.fade),
              ),
              Text(
                pr.numOfRepasses.toString(),
                style: const TextStyle(overflow: TextOverflow.fade),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
