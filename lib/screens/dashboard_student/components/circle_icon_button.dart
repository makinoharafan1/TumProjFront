import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {

  final Function() onPress;

  final Color backgroundColor;
  final Color iconContentColor;
  final IconData iconData;

  const CircleIconButton({
    super.key,
    required this.onPress,
    required this.backgroundColor,
    required this.iconContentColor,
    required this.iconData
  });

  @override
  Widget build(BuildContext context) {
      return CircleAvatar(
        backgroundColor: backgroundColor,
        child: IconButton(
          icon: Icon(iconData, color: iconContentColor),
          onPressed: onPress,
      ),
    );
  }
}