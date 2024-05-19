import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:puble_frontend/data/pr_data.dart';
import 'package:puble_frontend/models/pr_model.dart';
import 'package:puble_frontend/const/constant.dart';
import 'package:puble_frontend/utils/time_diff.dart';
import 'package:puble_frontend/utils/open_link.dart';
import 'package:puble_frontend/utils/search_provider.dart';
import 'package:puble_frontend/utils/sort_provider.dart';

class PullRequestsList extends StatefulWidget {
  const PullRequestsList({super.key});

  @override
  State<PullRequestsList> createState() => _PullRequestsListState();
}

class _PullRequestsListState extends State<PullRequestsList> {
  @override
  Widget build(BuildContext context) {
    final query = Provider.of<SearchProvider>(context).query;
    final pullRequests = Provider.of<PullRequestData>(context).data;
    final sortCriteria = Provider.of<SortProvider>(context).criteria;

    int? queryInt = int.tryParse(query);

    final filteredItems = pullRequests
        .where((item) =>
            item.studentName.toLowerCase().contains(query) ||
            (queryInt != null && (item.labNumber == queryInt)))
        .toList();

    filteredItems.sort((a, b) {
      switch (sortCriteria) {
        case SortCriteria.labNumber:
          return a.labNumber.compareTo(b.labNumber);
        case SortCriteria.name:
          return a.studentName
              .toLowerCase()
              .compareTo(b.studentName.toLowerCase());
        case SortCriteria.date:
          return a.date.compareTo(b.date);
        default:
          return 0;
      }
    });

    return ListView.builder(
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: filteredItems.length,
      itemBuilder: (context, index) =>
          PullRequestElement(pr: filteredItems[index]),
    );
  }
}

class PullRequestElement extends StatelessWidget {
  final PullRequestModel pr;
  const PullRequestElement({super.key, required this.pr});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: cardBackgroundColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: IconButton(
          icon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    pr.labNumber.toString(),
                    style: const TextStyle(
                      overflow: TextOverflow.fade,
                      fontSize: 20,
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Text(
                    pr.studentName.toString(),
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 20,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    pr.group.toString(),
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 20,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    timeDifference(pr.date),
                    style: const TextStyle(
                      overflow: TextOverflow.fade,
                      fontSize: 20,
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: primaryColor,
                  child: IconButton(
                    icon: const Icon(Icons.link, color: Colors.black),
                    onPressed: () async {
                      openLink(pr.prLink);
                    },
                  ),
                ),
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
