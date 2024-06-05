import 'package:flutter/material.dart';
import 'package:puble_frontend/const/constant.dart';

import 'package:puble_frontend/models/task_model.dart';
import 'package:puble_frontend/screens/dashboard/components/teacher_task_list.dart';
import 'package:puble_frontend/screens/dashboard/components/teacher_task_description.dart';

class InfoWidget extends StatefulWidget {
  const InfoWidget({super.key});

  @override
  State<InfoWidget> createState() => _InfoWidget();
}

class _InfoWidget extends State<InfoWidget> {

  Widget? currentWidget;

  void GetTaskDescription(Task selectedTask) {
      setState(() {
        currentWidget = TeacherTaskDescription(selectedTask: selectedTask, back: GetTaskList);
      });
  }

  void GetTaskList(){
    setState(() {
      currentWidget = TeacherTaskList(callback: GetTaskDescription,);
    });
  }

  @override
  void initState() {
    super.initState();
    currentWidget = TeacherTaskList(callback: GetTaskDescription,);
  } 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 550,
      child: null,
    );
  }
}
