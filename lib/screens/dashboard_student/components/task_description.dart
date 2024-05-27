import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:puble_frontend/const/constant.dart';

class TaskDescription extends StatelessWidget {
  final String description;

  const TaskDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: const BoxDecoration(
        color: cardBackgroundColor,
      ),
      child: Markdown(
          data: description,
        ),
    );
  }
}
