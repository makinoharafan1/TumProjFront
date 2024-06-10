import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:puble_frontend/data/pr_data.dart';
import 'package:puble_frontend/models/auth_model.dart';
import 'package:puble_frontend/models/pr_model.dart';
import 'package:puble_frontend/const/constant.dart';
import 'package:puble_frontend/utils/check_pr_check.dart';
import 'package:puble_frontend/utils/get_pr_on_teacher.dart';
import 'package:puble_frontend/utils/send_checking_pr.dart';
import 'package:puble_frontend/utils/time_diff.dart';
import 'package:puble_frontend/utils/open_link.dart';
import 'package:puble_frontend/utils/search_provider.dart';
import 'package:puble_frontend/utils/sort_provider.dart';
import 'package:puble_frontend/variables/variables.dart';

class PullRequestsList extends StatefulWidget {
  const PullRequestsList({super.key});

  @override
  State<PullRequestsList> createState() => _PullRequestsListState();
}

class _PullRequestsListState extends State<PullRequestsList> {
  late Future<List<PullRequestModel>> pr_data;
  @override
  void initState() {
    pr_data = getListOfPR(authKey: authKey!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: pr_data,
      builder: (context, snapshot) => snapshot.hasData
          ? getListView(context, snapshot.data!)
          : const CircularProgressIndicator(),
    );
    // final query = Provider.of<SearchProvider>(context).query;
    // final pullRequests = Provider.of<PullRequestData>(context).data;
    // final sortProvider = Provider.of<SortProvider>(context);
    // final sortCriteria = sortProvider.criteria;
    // final ascending = sortProvider.ascending;

    // int? queryInt = int.tryParse(query);

    // final filteredItems = pullRequests
    //     .where((item) =>
    //         item.studentName.toLowerCase().contains(query) ||
    //         (queryInt != null && (item.labNumber == queryInt)))
    //     .toList();

    // filteredItems.sort((a, b) {
    //   int comparison;
    //   switch (sortCriteria) {
    //     case SortCriteria.labNumber:
    //       comparison = a.labNumber.compareTo(b.labNumber);
    //       break;
    //     case SortCriteria.name:
    //       comparison = a.studentName
    //           .toLowerCase()
    //           .compareTo(b.studentName.toLowerCase());
    //       break;
    //     case SortCriteria.date:
    //       comparison = a.date.compareTo(b.date);
    //       break;
    //     case SortCriteria.group:
    //       comparison = a.group.toLowerCase().compareTo(b.group.toLowerCase());
    //       break;
    //     default:
    //       return 0;
    //   }
    //   return ascending ? comparison : -comparison;
    // });
    // return ListView.builder(
    //   shrinkWrap: true,
    //   physics: const AlwaysScrollableScrollPhysics(),
    //   itemCount: filteredItems.length,
    //   itemBuilder: (context, index) =>
    //       PullRequestElement(pr: filteredItems[index]),
    // );
  }

  Widget getListView(
      BuildContext context, List<PullRequestModel> pullRequests) {
    final query = Provider.of<SearchProvider>(context).query;
    // final pullRequests = Provider.of<PullRequestData>(context).data;
    final sortProvider = Provider.of<SortProvider>(context);
    final sortCriteria = sortProvider.criteria;
    final ascending = sortProvider.ascending;

    int? queryInt = int.tryParse(query);

    final filteredItems = pullRequests
        .where((item) =>
            item.studentName.toLowerCase().contains(query) ||
            (queryInt != null && (item.labNumber == queryInt)))
        .toList();

    filteredItems.sort((a, b) {
      int comparison;
      switch (sortCriteria) {
        case SortCriteria.labNumber:
          comparison = a.labNumber.compareTo(b.labNumber);
          break;
        case SortCriteria.name:
          comparison = a.studentName
              .toLowerCase()
              .compareTo(b.studentName.toLowerCase());
          break;
        case SortCriteria.date:
          comparison = a.date.compareTo(b.date);
          break;
        case SortCriteria.group:
          comparison = a.group.toLowerCase().compareTo(b.group.toLowerCase());
          break;
        default:
          return 0;
      }
      return ascending ? comparison : -comparison;
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
                  flex: 7,
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
                  flex: 3,
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
                      final r = await checkPRCheck(authKey: authKey!);
                      if (r) {
                        sendCheckingPR(authKey: authKey!, prLink: pr.prLink);
                        openLink(pr.prLink);
                      } else {
                        bool f = false;
                        if (context.mounted) {
                          await showDialog<void>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text(
                                  'Вы не отметили проверку на прошлом PR. Начать просмотр другого?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    f = true;
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Yes'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    f = false;
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('No'),
                                )
                              ],
                            ),
                          );
                          if (f) {
                            sendCheckingPR(
                                authKey: authKey!, prLink: pr.prLink);
                            openLink(pr.prLink);
                          }
                        }
                      }
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
