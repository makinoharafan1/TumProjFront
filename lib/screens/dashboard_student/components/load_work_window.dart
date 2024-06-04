import 'package:flutter/material.dart';

class LoadWorkWindow extends StatelessWidget {

  final String title;
  final String hintText;

  const LoadWorkWindow({
    super.key, 
    required this.title, 
    required this.hintText
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: SizedBox(
        width: 400,
        child: TextField(
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
          onPressed: () => Navigator.pop(context, 'Отправить'),
          child: const Text('Отправить'),
        ),
      ],
    );
  }
}
