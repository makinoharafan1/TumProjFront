import 'package:flutter/material.dart';
import 'package:puble_frontend/utils/responsive.dart';

import 'package:puble_frontend/screens/dashboard_student/components/info_widget.dart';
import 'package:puble_frontend/screens/dashboard/components/side_menu_widget.dart';

// import 'package:puble_frontend/screens/dashboard_student/components/task_description.dart';
import 'package:puble_frontend/screens/dashboard_student/components/task_list.dart';

import 'package:puble_frontend/models/task_model.dart';

class DashboardStudentScreen extends StatefulWidget {
  const DashboardStudentScreen({super.key});

  @override
  State<DashboardStudentScreen> createState() => _DashboardStudentScreen();
}


class _DashboardStudentScreen extends State<DashboardStudentScreen> {

  Task? selectedTask;
  Widget? currentWidget;

  void closeTaskDescription(){
    setState(() => currentWidget = InfoWidget(task: null, close: closeTaskDescription,));
  }

  void updateSelectedTask(Task newTask){
    
    if (selectedTask == newTask) {
      return;
    }

    setState(() => currentWidget = InfoWidget(task: newTask, close: closeTaskDescription,));
  }

  @override
  void initState(){
    super.initState();
    currentWidget = InfoWidget(task: null, close: closeTaskDescription,);
  }

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
          ? SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: currentWidget,
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
            Expanded(
              flex: 6,
              child: TaskList(callback: updateSelectedTask,),
            ),
            currentWidget!,
          ],
        ),
      ),
    );
  }
}
