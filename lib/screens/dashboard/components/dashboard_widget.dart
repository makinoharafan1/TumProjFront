import 'package:flutter/material.dart';
import 'package:puble_frontend/screens/dashboard/components/header_widget.dart';
import 'package:puble_frontend/screens/dashboard/components/test_list.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            HeaderWidget(),
            UsersList(),
          ],
        ),
      ),
    );
  }
}
