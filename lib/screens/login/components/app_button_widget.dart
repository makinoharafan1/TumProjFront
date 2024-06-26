import 'package:flutter/material.dart';
import 'package:puble_frontend/const/constant.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;

  const AppButton({super.key, this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 150,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(mediumCircularRadius),
        ),
        child: Center(
          child: Text(text!,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.black)),
        ),
      ),
    );
  }
}
