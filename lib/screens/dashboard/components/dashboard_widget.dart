import 'package:flutter/material.dart';
import 'package:puble_frontend/screens/dashboard/components/header_widget.dart';
import 'package:puble_frontend/screens/dashboard/components/pr_list_widget.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false, ),
      child: SingleChildScrollView(
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const HeaderWidget(),
            const SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const PullRequestsList(),
            )
          ],
        ),
      ),
    ),
    ); 
  }
}
