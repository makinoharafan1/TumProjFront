import 'package:flutter/material.dart';
import 'package:puble_frontend/utils/responsive.dart';
import 'package:puble_frontend/screens/dashboard/components/info_widget.dart';
import 'package:puble_frontend/screens/dashboard/components/dashboard_widget.dart';
import 'package:puble_frontend/screens/dashboard/components/side_menu_widget.dart';

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
              const Expanded(
                flex: 2,
                child: SizedBox(
                  child: SideMenuWidget(),
                ),
              ),
            const Expanded(
              flex: 6,
              child: DashboardWidget(),
            ),
            const Expanded(
              flex: 3,
              child: InfoWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
