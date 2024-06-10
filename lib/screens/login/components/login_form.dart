import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puble_frontend/models/auth_model.dart';

import 'package:puble_frontend/screens/dashboard/dashboard_screen.dart';
import 'package:puble_frontend/screens/dashboard_student/dashboard_student_screen.dart';
import 'package:puble_frontend/screens/login/components/input_widget.dart';
import 'package:puble_frontend/screens/login/components/app_button_widget.dart';
import 'package:puble_frontend/utils/get_auth_key.dart';
import 'package:puble_frontend/variables/variables.dart';

Form loginForm(BuildContext context, TextEditingController passwordController,
    TextEditingController emailController) {
  return Form(
      child: Consumer<AuthModel>(
    builder: (context, value, child) => Column(
      children: [
        InputWidget(
          keyboardType: TextInputType.emailAddress,
          onSaved: (String? v) {
            value.logging = v!;
          },
          onChanged: (String? v) {
            value.logging = v!;
          },
          // validator: (String? value) {},
          topLabel: "E-mail",
          hintText: "Enter e-mail",
          textEditingController: emailController,
        ),
        const Spacer(flex: 1),
        InputWidget(
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          topLabel: "Password",
          hintText: "Enter password",
          onSaved: (String? uPassword) {
            value.password = uPassword!;
          },
          onChanged: (String? v) {
            value.password = v!;
          },
          // validator: (String? value) {},
          textEditingController: passwordController,
        ),
        const Spacer(flex: 2),
        AppButton(
          onPressed: () async {
            var x = await getAuthKey(
              logging: value.logging,
              password: value.password,
            );
            if (userType == "teacher" && context.mounted && x) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DashboardScreen()),
              );
            } else if (userType == "student" && context.mounted && x) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DashboardStudentScreen()),
              );
            } else {
              if (context.mounted) {
                await showDialog<void>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text(
                      'Incorrect user',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Ok'),
                      )
                    ],
                  ),
                );
              }
            }
          },
          text: "Login",
        ),
        const Spacer(flex: 14),
      ],
    ),
  ));
}
