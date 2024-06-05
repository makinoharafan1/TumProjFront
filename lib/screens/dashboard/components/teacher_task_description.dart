import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:puble_frontend/const/constant.dart';

import 'package:puble_frontend/screens/dashboard_student/components/task_description_button.dart';

import 'package:puble_frontend/models/task_model.dart';

class TeacherTaskDescription extends StatefulWidget {
  const TeacherTaskDescription({
    super.key, 
    required this.selectedTask, 
    required this.back, 
    });

  final Function() back;

  final Task selectedTask;

  @override
  _TeacherTaskDescription createState() => _TeacherTaskDescription();
}

class _TeacherTaskDescription extends State<TeacherTaskDescription> {

  bool? isRedacting;

  String? savedText;

  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isRedacting = false;
    textEditingController.text = widget.selectedTask.description;
  } 

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
        child: isRedacting!
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
                    isRedacting = !isRedacting!;
                  })
                ),
              ),
              TaskDescriptionButton(
                text: "Undo Changes", 
                onTap: () => (
                  setState(() {
                      textEditingController.text = savedText!;
                      isRedacting = !isRedacting!;
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
            TaskDescriptionButton(
              text: "Redact", 
              onTap: () => (
                setState(() {
                  savedText = text;
                  isRedacting = !isRedacting!;
                })
                ),
            ),
            TaskDescriptionButton(
              text: "Back", 
              onTap: () => widget.back(),
            ),
          ],
        ),
        Expanded(
          child: Markdown(
            data: text,
            styleSheet: MarkdownStyleSheet(
              
            ),
          ),
        ),
      ],
    );
  }
}
