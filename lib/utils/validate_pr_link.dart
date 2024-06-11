import 'package:flutter/material.dart';

Future<bool> validatePRLink(
    {required String prLink, required BuildContext context}) async {
  final z = Uri.parse(prLink);
  final x = z.isAbsolute &&
      z.pathSegments[2] == 'pull' &&
      z.pathSegments.length == 4 &&
      int.tryParse(z.pathSegments.last) != null;

  if (!x) {
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Not correct pr link',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
  return x;
}
