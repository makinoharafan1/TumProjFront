import 'package:flutter/material.dart';
import 'package:puble_frontend/utils/create_pr.dart';
import 'package:puble_frontend/variables/variables.dart';

class LoadWorkWindow extends StatelessWidget {
  final String title;
  final String hintText;

  const LoadWorkWindow(
      {super.key, required this.title, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: SizedBox(
        width: 400,
        child: TextField(
          onChanged: (value) {
            sendingLink = value;
          },
          decoration: InputDecoration(
            hintText: hintText,
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Отмена'),
          child: const Text('Отмена'),
        ),
        TextButton(
          onPressed: () {
            createPR(link: sendingLink!, comment: '');
            Navigator.pop(context, 'Отправить');
          },
          child: const Text('Отправить'),
        ),
      ],
    );
  }
}
