import 'package:flutter/material.dart';

class ConfirmationWindow extends StatelessWidget {

  final String title;
  final String description;

  const ConfirmationWindow({
    super.key, 
    required this.title, 
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(description),
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
