import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:puble_frontend/data/pr_data.dart';
import 'package:puble_frontend/models/pr_model.dart';
import 'package:puble_frontend/const/constant.dart';

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
      itemBuilder: (context, index) => PullRequestElement(pr: data.data[index]),
    );
  }
}

class PullRequestElement extends StatelessWidget {
  final PullRequestModel pr;
  const PullRequestElement({super.key, required this.pr});

  Future<void> _openLink(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $urlString';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: listElementColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: IconButton(
          icon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
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

                CircleAvatar(
                  backgroundColor: primaryColor,
                  child: IconButton(
                  icon: const Icon(Icons.link, color: Colors.black),
                  onPressed: () async {
                    _openLink(pr.prLink);
                  },
                ))
              ],
            ),
          ),

          onPressed: () async {
            // _openLink(pr.prLink);
          },
        ),
      ),
    );
  }
}
