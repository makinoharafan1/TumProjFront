import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tum_proj/funtions/get_list_of_pr.dart';
import 'package:tum_proj/models/pr_list_model.dart';
import 'package:tum_proj/view/work_place.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset(
            'assets/logo.svg',
            width: 30,
            fit: BoxFit.fitHeight,
          ),
        ),
        body: FutureProvider<PullRequestsListModel>(
          initialData: PullRequestsListModel(list: []),
          create: (context) => getListOfPullRequests(),
          child: const WorkPlace(),
        ),
      ),
    );
  }
}
