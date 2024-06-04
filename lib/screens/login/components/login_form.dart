import 'package:flutter/material.dart';

import 'package:puble_frontend/screens/dashboard/dashboard_screen.dart';
import 'package:puble_frontend/screens/dashboard_student/dashboard_student_screen.dart';
import 'package:puble_frontend/screens/login/components/input_widget.dart';
import 'package:puble_frontend/screens/login/components/app_button_widget.dart';

Form loginForm(BuildContext context, TextEditingController passwordController,
    TextEditingController emailController) {
  return Form(
    child: Column(
      children: [
        InputWidget(
          keyboardType: TextInputType.emailAddress,
          onSaved: (String? value) {},
          // onChanged: (String? value) {},
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
          onSaved: (String? uPassword) {},
          // onChanged: (String? value) {},
          // validator: (String? value) {},
          textEditingController: passwordController,
        ),
        const Spacer(flex: 2),
        AppButton(
          onPressed: () => ({
            if (emailController.text == "teacher")
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DashboardScreen()),
                )
              },
            if (emailController.text == "student")
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DashboardStudentScreen()),
                )
              }
          }),
          text: "Login",
        ),
        const Spacer(flex: 14),
      ],
    ),
  );
}
