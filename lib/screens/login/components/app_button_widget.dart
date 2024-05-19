import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;

  AppButton({this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onPressed,
      child: Container(
        width: 150,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          // boxShadow: [
          //   BoxShadow(
          //       //color: Color.fromRGBO(169, 176, 185, 0.42),
          //       //spreadRadius: 0,
          //       //blurRadius: 3.0,
          //       //offset: Offset(0, 2),
          //       ),
          // ],
        ),
        child: Center(
          child: Text(this.text!,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.black)),
        ),
      ),
    );
  }
}
