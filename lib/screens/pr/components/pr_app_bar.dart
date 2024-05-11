import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PRAppBar extends StatelessWidget {
  PRAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SvgPicture.asset(
        'assets/logo.svg',
        width: 30,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}