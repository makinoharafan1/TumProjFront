import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:puble_frontend/const/constant.dart';
import 'package:puble_frontend/screens/dashboard/dashboard_screen.dart';

import 'package:puble_frontend/screens/login/components/input_widget.dart';
import 'package:puble_frontend/screens/login/components/app_button_widget.dart';

// import 'package:email_validator/email_validator.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  bool initialPosition = true;
  int animationTime = 500;

  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
              width: MediaQuery.of(context).size.width / 3.2,
              height: MediaQuery.of(context).size.height / 1.15,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(defaultCircularRadius),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 1,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset("logo.png", scale: 2),
                  Container(
                    height: 400,
                    margin: const EdgeInsets.only(
                        left: 30, top: 30, right: 30, bottom: 0),
                    child: initialPosition
                        ? loginForm(context)
                        : registerForm(context),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  toggle(context, ["Sign In", "Sign Up"]),
                ],
              )),
        ),
      ),
    );
  }

  Form loginForm(BuildContext context) {
    return Form(
      child: Column(
        children: [
          InputWidget(
            keyboardType: TextInputType.emailAddress,
            onSaved: (String? value) {},
            // onChanged: (String? value) {},
            // validator: (String? value) {},
            topLabel: "Email",
            hintText: "Enter E-mail",
            textEditingController: emailController,
          ),
          const SizedBox(
            height: 10,
          ),
          InputWidget(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            topLabel: "Password",
            hintText: "Enter Password",
            onSaved: (String? uPassword) {},
            // onChanged: (String? value) {},
            // validator: (String? value) {},
            textEditingController: passwordController,
          ),
          const SizedBox(
            height: 40,
          ),
          AppButton(
            onPressed: () => ({
              // if (emailController.text == "teacher")
              //   {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DashboardScreen()),
                  )
                // }
            }),
            text: "Login",
          ),
        ],
      ),
    );
  }

  Form registerForm(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 6,
                child: InputWidget(
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (String? value) {},
                  // onChanged: (String? value) {},
                  // validator: (String? value) {},
                  topLabel: "Name",
                  hintText: "Enter Name",
                  textEditingController: nameController,
                ),
              ),
              const Spacer(flex: 1,),
              Expanded(
                flex: 6,
                child: InputWidget(
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (String? value) {},
                  // onChanged: (String? value) {},
                  // validator: (String? value) {},
                  topLabel: "Surname",
                  hintText: "Enter Surname",
                  textEditingController: surnameController,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          InputWidget(
            keyboardType: TextInputType.emailAddress,
            onSaved: (String? value) {},
            // onChanged: (String? value) {},
            // validator: (String? value) {},
            topLabel: "Email",
            hintText: "Enter E-mail",
            textEditingController: emailController,
          ),
          const SizedBox(
            height: 10,
          ),
          InputWidget(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            topLabel: "Password",
            hintText: "Enter Password",
            onSaved: (String? uPassword) {},
            // onChanged: (String? value) {},
            // validator: (String? value) {},
            textEditingController: passwordController,
          ),
          const SizedBox(
            height: 10,
          ),
          InputWidget(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            topLabel: "Confirm Password",
            hintText: "Confirm Password",
            onSaved: (String? uPassword) {},
            // onChanged: (String? value) {},
            // validator: (String? value) {},
            textEditingController: confirmPasswordController,
          ),
          const SizedBox(
            height: 30,
          ),
          AppButton(
            onPressed: () => (),
            text: "Create Acount",
          ),
        ],
      ),
    );
  }

  SizedBox toggle(BuildContext context, List<String> values) {
    return SizedBox(
      width: 300,
      height: 50,
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              initialPosition = !initialPosition;
              nameController.clear();
              surnameController.clear();
              emailController.clear();
              passwordController.clear();
              confirmPasswordController.clear();
              setState(() {});
            },
            child: Container(
              width: 300,
              height: 50,
              margin: const EdgeInsets.only(top: 8, bottom: 8),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  values.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      values[index],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedAlign(
            duration: Duration(milliseconds: animationTime),
            curve: Curves.decelerate,
            alignment:
                initialPosition ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              width: 150,
              height: 40,
              decoration: ShapeDecoration(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                initialPosition ? values[0] : values[1],
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
