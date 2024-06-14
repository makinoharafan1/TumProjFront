import 'package:flutter/material.dart';

import 'package:puble_frontend/screens/dashboard_student/components/circle_icon_button.dart';
import 'package:puble_frontend/screens/dashboard_student/components/circle_icon.dart';

import 'package:puble_frontend/screens/dashboard_student/components/confirmation_window.dart';
import 'package:puble_frontend/screens/dashboard_student/components/load_work_window.dart';

enum TaskState { NotLoaded, Awaiting, Rejected, Approved}

class Task{
  final int number;
  String description;
  TaskState state;
  Task({
    required this.number,
    required this.description,
    required this.state,
  });
}

var map = <TaskState, Function(BuildContext)>{
  TaskState.NotLoaded: (context) {
    return CircleIconButton(
      onPress: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => const LoadWorkWindow(title: "Отправка", hintText: "Вставте ссылку на репозиторий",),
      ),
      backgroundColor: Colors.grey,
      iconContentColor: Colors.black, 
      iconData: Icons.add,
    );
  },

  TaskState.Awaiting: (context) {
    return const CircleIcon(
      backgroundColor: Colors.yellow,
      iconContentColor: Colors.black, 
      iconData: Icons.remove_red_eye,
    );
  },

  TaskState.Approved: (context) {
    return const CircleIcon(
      backgroundColor: Colors.green,
      iconContentColor: Colors.black, 
      iconData: Icons.check,
    );
  },

  TaskState.Rejected: (context) {
    return CircleIconButton(
      onPress: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => const ConfirmationWindow(title: "Подтверждение", description: "Отправить работу на проверку преподавателю",),
      ),
      backgroundColor: Colors.red,
      iconContentColor: Colors.black, 
      iconData: Icons.clear,
    );
  }
};
