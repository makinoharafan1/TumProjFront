import 'package:flutter/material.dart';
import 'package:puble_frontend/const/constant.dart';

class TaskDescriptionButton extends StatelessWidget {
  final Function() onTap;
  final String text;

  const TaskDescriptionButton({
    super.key, 
    required this.onTap,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 25,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(lowCircularRadius),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
