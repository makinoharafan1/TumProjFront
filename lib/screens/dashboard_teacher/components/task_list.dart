import 'package:flutter/material.dart';
import 'package:puble_frontend/const/constant.dart';

import 'package:provider/provider.dart';
import 'package:puble_frontend/data/task_data.dart';

import 'package:puble_frontend/models/task_model.dart';

class TeacherTaskList extends StatelessWidget {
  final void Function(Task) callback;

  const TeacherTaskList({
    super.key,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TaskData>(context).data;

    return Container(
    decoration: const BoxDecoration(
      color: cardBackgroundColor,
    ),
    child: ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        scrollbars: false,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Task List",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: mainTextColor,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: tasks.length,
                itemBuilder: (context, index) => TaskElement(
                  task: tasks[index],
                  callback: callback,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class TaskElement extends StatelessWidget {
  final Task task;

  final void Function(Task) callback;

  const TaskElement({super.key, required this.task, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: listElementColor,
          borderRadius: BorderRadius.circular(highCircularRadius),
        ),
        child: IconButton(
          icon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    task.number.toString(),
                    style: const TextStyle(
                      overflow: TextOverflow.fade,
                      fontSize: 14,
                      color: mainTextColor,
                    ),
                  ),
                ),
                const Expanded(
                  flex: 10,
                  child: Text(
                    "Лабораторная работа",
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 14,
                      color: mainTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          onPressed: () async {
            callback(task);
          },
        ),
      ),
    );
  }
}
