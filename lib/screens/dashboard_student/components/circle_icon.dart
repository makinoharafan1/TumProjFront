import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {

  final Color backgroundColor;
  final Color iconContentColor;
  final IconData iconData;

  const CircleIcon({
    super.key,
    required this.backgroundColor,
    required this.iconContentColor,
    required this.iconData
  });

  @override
  Widget build(BuildContext context) {
      return CircleAvatar(
        backgroundColor: backgroundColor,
        child: Icon(iconData, color: iconContentColor),
    );
  }
}