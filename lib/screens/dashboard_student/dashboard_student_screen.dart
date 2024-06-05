import 'package:flutter/material.dart';
import 'package:puble_frontend/utils/responsive.dart';

import 'package:puble_frontend/screens/dashboard_student/components/info_widget.dart';
import 'package:puble_frontend/screens/dashboard/components/side_menu_widget.dart';

import 'package:puble_frontend/screens/dashboard_student/components/task_description.dart';
import 'package:puble_frontend/screens/dashboard_student/components/task_list.dart';

import 'package:puble_frontend/models/task_model.dart';

class DashboardStudentScreen extends StatefulWidget {
  const DashboardStudentScreen({super.key});

  @override
  State<DashboardStudentScreen> createState() => _DashboardStudentScreen();
}


class _DashboardStudentScreen extends State<DashboardStudentScreen> {

  Task? selectedTask;
  bool isRedacting = false;

  void updateMode(bool state) => setState(() {isRedacting = state;});
  void updateSelectedTask(Task newTask){
    
    if (selectedTask == newTask) {
      return;
    }

    updateMode(false);
    setState(() => selectedTask = newTask);
  }

  double descriptionBoxWidthStart = 550;
  double descriptionBoxWidthMin = 250;
  double descriptionBoxWidthMax = 700;

  double descriptionBoxWidth = 550;

  double opacityLevel = 0;

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
              child: const InfoWidget(),
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
            const Expanded(
              flex: 3,
              child: InfoWidget(),
            ),
            // if (selectedTask != null)
            //   Row(
            //     children: [
            //       GestureDetector(
            //         onHorizontalDragUpdate: (details) {
            //           setState(() {
            //               opacityLevel = 1;

            //               descriptionBoxWidth = (descriptionBoxWidth - details.delta.dx).clamp(descriptionBoxWidthMin, descriptionBoxWidthMax);
            //               if (descriptionBoxWidth == descriptionBoxWidthMin) {
            //                 selectedTask = null;
            //                 descriptionBoxWidth = descriptionBoxWidthStart;
            //               }
            //           });
            //         },
            //         onHorizontalDragEnd: (dragEndDetails){
            //           setState(() {opacityLevel = 0;});
            //         },
            //         child : InkWell(
            //           onTap: () => (),
            //           onHover: (value) {
            //             setState(() {
            //               opacityLevel = value ? 1 : 0;
            //             });
            //           },
            //           child: AnimatedOpacity(
            //             opacity: opacityLevel,
            //             duration: const Duration(milliseconds: 100),
            //             child: Container(
            //                 width: 5,
            //                 height: MediaQuery.of(context).size.height,
            //                 color: Colors.blue,
            //             ),
            //           ),
            //         ),
            //       ),
            //       SizedBox(
            //         width: descriptionBoxWidth,
            //         child: TaskDescription(selectedTask: selectedTask!, updateMode: updateMode, isRedacting: isRedacting,),
            //       )
            //     ],
            //   ),
          ],
        ),
      ),
    );
  }
}
