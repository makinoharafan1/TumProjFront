import 'package:flutter/material.dart';
import 'package:puble_frontend/const/constant.dart';

class CustomButton extends StatelessWidget{
  final Function()? onTap;

  const CustomButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Colors.white, width: 1),
        ),
        minimumSize: const Size(150, 50),
      ),

      child: const Text(
        "Login",
        style: TextStyle(
          color:  Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
