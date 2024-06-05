import 'package:flutter/material.dart';
import 'package:puble_frontend/const/constant.dart';

import 'package:provider/provider.dart';
import 'package:puble_frontend/data/task_data.dart';

import 'package:puble_frontend/models/task_model.dart';


class TaskList extends StatelessWidget {

  final void Function(Task) callback;

  final String title;

  const TaskList({
    super.key, 
    required this.callback,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    
    final tasks = Provider.of<TaskData>(context).data;

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        scrollbars: false,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
               Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
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
                  itemBuilder: (context, index) => TaskElement(task: tasks[index], callback: callback,),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class TaskElement extends StatelessWidget {
  final Task task;

  final void Function(Task) callback;

  const TaskElement({
    super.key, 
    required this.task,
    required this.callback
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: cardBackgroundColor,
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
                      fontSize: 20,
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
                      fontSize: 20,
                      color: mainTextColor,
                    ),
                  ),
                ),
                map[task.state]!(context),
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
