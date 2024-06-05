import 'package:flutter/material.dart';
import 'package:puble_frontend/utils/responsive.dart';
import 'package:puble_frontend/screens/dashboard_teacher/components/info_widget.dart';
import 'package:puble_frontend/screens/dashboard_teacher/components/dashboard_widget.dart';
import 'package:puble_frontend/screens/dashboard_teacher/components/side_menu_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      drawer: !isDesktop
          ? const SizedBox(
              width: 250,
              child: SideMenuWidget(),
            )
          : null,
      endDrawer: Responsive.isMobile(context)
          ? const SizedBox(
              width: 250,
              child: InfoWidget(),
            )
          : null,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isDesktop)
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: const SideMenuWidget(),
              ),
            const Expanded(
              flex: 6,
              child: DashboardWidget(),
            ),
            const InfoWidget(),
          ],
        ),
      ),
    );
  }
}
