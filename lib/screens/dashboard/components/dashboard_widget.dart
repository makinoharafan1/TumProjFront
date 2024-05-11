import 'package:flutter/material.dart';
// import 'package:puble_frontend/screens/dashboard/components/header_widget.dart';
// import 'package:puble_frontend/screens/dashboard/components/test_list.dart';
import 'package:puble_frontend/screens/dashboard/components/pr_list_widget.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            //HeaderWidget(),
            //UsersList(),
            SizedBox(height: 50,),
            SizedBox(
              height: double.maxFinite,
              child: const PullRequestsList(),
            )
          ],
        ),
      ),
    );
  }
}
