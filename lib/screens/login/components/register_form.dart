import 'package:flutter/material.dart';

import 'package:puble_frontend/screens/login/components/input_widget.dart';
import 'package:puble_frontend/screens/login/components/app_button_widget.dart';

Form registerForm(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController surnameController,
    TextEditingController emailController,
    TextEditingController passwordController,
    TextEditingController confirmPasswordController) {
  return Form(
    child: Column(
      children: [
        InputWidget(
          keyboardType: TextInputType.emailAddress,
          onSaved: (String? value) {},
          // onChanged: (String? value) {},
          // validator: (String? value) {},
          topLabel: "Name",
          hintText: "Enter name",
          textEditingController: nameController,
        ),
        const Spacer(flex: 3),
        InputWidget(
          keyboardType: TextInputType.emailAddress,
          onSaved: (String? value) {},
          // onChanged: (String? value) {},
          // validator: (String? value) {},
          topLabel: "Surname",
          hintText: "Enter surname",
          textEditingController: surnameController,
        ),
        const Spacer(flex: 3),
        InputWidget(
          keyboardType: TextInputType.emailAddress,
          onSaved: (String? value) {},
          // onChanged: (String? value) {},
          // validator: (String? value) {},
          topLabel: "Email",
          hintText: "Enter e-mail",
          textEditingController: emailController,
        ),
        const Spacer(flex: 3),
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
        const Spacer(flex: 3),
        InputWidget(
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          topLabel: "Confirm password",
          hintText: "Re-enter password",
          onSaved: (String? uPassword) {},
          // onChanged: (String? value) {},
          // validator: (String? value) {},
          textEditingController: confirmPasswordController,
        ),
        const Spacer(flex: 8),
        AppButton(
          onPressed: () => (),
          text: "Create account",
        ),
        const Spacer(flex: 14),
      ],
    ),
  );
}
