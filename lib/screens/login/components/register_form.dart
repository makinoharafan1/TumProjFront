import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puble_frontend/models/auth_model.dart';

import 'package:puble_frontend/screens/login/components/input_widget.dart';
import 'package:puble_frontend/screens/login/components/app_button_widget.dart';
import 'package:puble_frontend/utils/register_student.dart';

Form registerForm(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController surnameController,
    TextEditingController emailController,
    TextEditingController passwordController,
    TextEditingController confirmPasswordController) {
  return Form(
    child: Consumer<RegisterModel>(
      builder: (context, value, child) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 7,
                child: InputWidget(
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (String? value) {},
                  onChanged: (String? v) {
                    value.name = v!;
                  },
                  // validator: (String? value) {},
                  topLabel: "Name",
                  hintText: "Enter name",
                  textEditingController: nameController,
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 7,
                child: InputWidget(
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (String? value) {},
                  onChanged: (String? v) {
                    value.sername = v!;
                  },
                  // validator: (String? value) {},
                  topLabel: "Surname",
                  hintText: "Enter surname",
                  textEditingController: surnameController,
                ),
              ),
            ],
          ),
          const Spacer(flex: 2),
          InputWidget(
            keyboardType: TextInputType.emailAddress,
            onSaved: (String? value) {},
            onChanged: (String? v) {
              value.mail = v!;
            },
            // validator: (String? value) {},
            topLabel: "Email",
            hintText: "Enter e-mail",
            textEditingController: emailController,
          ),
          const Spacer(flex: 2),
          InputWidget(
            topLabel: "Teacher",
            hintText: "Enter teacher",
            onSaved: (String? uPassword) {},
            onChanged: (String? v) {
              value.teacher = v!;
            },
          ),
          const Spacer(flex: 2),
          InputWidget(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            topLabel: "Password",
            hintText: "Enter password",
            onSaved: (String? uPassword) {},
            onChanged: (String? v) {
              value.password = v!;
            },
            // validator: (String? value) {},
            textEditingController: passwordController,
          ),
          const Spacer(flex: 2),
          InputWidget(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            topLabel: "Confirm password",
            hintText: "Re-enter password",
            onSaved: (String? uPassword) {},
            onChanged: (String? v) {
              value.password2 = v!;
            },
            // validator: (String? value) {},
            textEditingController: confirmPasswordController,
          ),
          const Spacer(flex: 3),
          AppButton(
            onPressed: () async {
              if (context.mounted && (value.password != value.password2)) {
                await showDialog<void>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text(
                      'Not equal passwords',
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
              } else {
                registerStudent(
                    logging: '${value.sername}_${value.name}',
                    password: value.password,
                    teacher: value.teacher);
              }
            },
            text: "Create account",
          ),
          const Spacer(flex: 14),
        ],
      ),
    ),
  );
}
