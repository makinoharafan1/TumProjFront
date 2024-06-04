import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:puble_frontend/const/constant.dart';

import 'package:puble_frontend/screens/dashboard_student/components/task_description_button.dart';

import 'package:puble_frontend/models/task_model.dart';

class TaskDescription extends StatefulWidget {
  const TaskDescription({
    super.key, 
    required this.selectedTask, 
    required this.updateMode, 
    required this.isRedacting,
    });

  final Function(bool) updateMode;

  final Task selectedTask;
  final bool isRedacting;

  @override
  _TaskDescription createState() => _TaskDescription();
}

class _TaskDescription extends State<TaskDescription> {

  String? savedText;

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    textEditingController.text = widget.selectedTask.description;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: const BoxDecoration(
        color: cardBackgroundColor,
      ),
      child: Container(
        margin: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        child: widget.isRedacting
            ? redactForm(context)
            : viewForm(context, textEditingController.text),
      ),
    );
  }

  SingleChildScrollView redactForm(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TaskDescriptionButton(
                text: "Save Changes", 
                onTap: () => (
                  setState(() {
                    widget.selectedTask.description = textEditingController.text;
                    widget.updateMode(!widget.isRedacting);
                  })
                ),
              ),
              TaskDescriptionButton(
                text: "Undo Changes", 
                onTap: () => (
                  setState(() {
                      widget.selectedTask.description = savedText!;
                      widget.updateMode(!widget.isRedacting);
                    })
                  ),
                ),
            ],
          ),
          TextField(
            controller: textEditingController,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            onChanged: (String text) {
              setState(() {
                textEditingController.text = text;
              });
            },
            keyboardType: TextInputType.multiline,
            maxLines: null,
          ),
        ],
      ),
    );
  }

  Column viewForm(BuildContext context, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TaskDescriptionButton(text: "Redact", 
              onTap: () => (
                setState(() {
                  savedText = widget.selectedTask.description;
                  widget.updateMode(!widget.isRedacting);
                })
                ),
            ),
          ],
        ),
        Expanded(
          child: Markdown(
            data: text,
          ),
        ),
      ],
    );
  }
}
