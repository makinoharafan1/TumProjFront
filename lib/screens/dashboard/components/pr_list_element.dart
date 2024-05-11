import 'package:flutter/material.dart';
import 'package:puble_frontend/models/pr_model.dart';

import 'package:puble_frontend/screens/pr/pr_screen.dart';

class PullRequestElement extends StatelessWidget {
  final PullRequestModel pr;
  const PullRequestElement({super.key, required this.pr});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 20, 81, 138),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PRScreen(pr:pr)));
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
      ),
    );
  }
}
