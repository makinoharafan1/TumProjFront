import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:puble_frontend/const/constant.dart';

import 'package:puble_frontend/models/task_model.dart';

class TaskDescription extends StatefulWidget {
  const TaskDescription({
    super.key, 
    required this.selectedTask,
    required this.close,
    });

  final Task? selectedTask;
  final Function() close;

  @override
  _TaskDescription createState() => _TaskDescription();
}

class _TaskDescription extends State<TaskDescription> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: const BoxDecoration(
        color: cardBackgroundColor,
      ),
      child: Container(
        margin: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  iconSize: 25,
                  icon: const Icon(Icons.clear, color: Colors.white),
                  onPressed: widget.close,
                ),
              ]
            ),
            Expanded(
              child: Markdown(
                data: widget.selectedTask == null ? "" : widget.selectedTask!.description,
                styleSheet: MarkdownStyleSheet.fromTheme(
                  ThemeData(
                    textTheme: const TextTheme(
                      headline1: TextStyle(
                        color: mainTextColor,
                        fontSize: 38,
                      ),

                      headline2: TextStyle(
                        color: mainTextColor,
                        fontSize: 34,
                      ),

                      headline3: TextStyle(
                        color: mainTextColor,
                        fontSize: 30,
                      ),

                      headline4: TextStyle(
                        color: mainTextColor,
                        fontSize: 30,
                      ),

                      headline5: TextStyle(
                        color: mainTextColor,
                        fontSize: 22,
                      ),

                      headline6: TextStyle(
                        color: mainTextColor,
                        fontSize: 18,
                      ),

                      bodyText1: TextStyle(
                        color: mainTextColor,
                        fontSize: 14,
                      ),

                      bodyText2: TextStyle(
                        color: mainTextColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
