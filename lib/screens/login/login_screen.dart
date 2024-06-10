import 'package:flutter/material.dart';
import 'package:particles_fly/particles_fly.dart';

import 'package:puble_frontend/const/constant.dart';
import 'package:puble_frontend/screens/login/components/login_form.dart';
import 'package:puble_frontend/screens/login/components/register_form.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            ParticlesFly(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              connectDots: true,
              numberOfParticles: 150,
              speedOfParticles: 0.1,
              lineStrokeWidth: 0.25,
              isRandomColor: true,
              lineColor: cardBackgroundColor,
              hoverRadius: 1000,
            ),
            SafeArea(
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 3.2,
                  decoration: const BoxDecoration(
                    color: backgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 2,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const SizedBox(height: 30),
                      Expanded(
                        flex: 2,
                        child: Image.asset("logo.png", scale: 1),
                      ),
                      const SizedBox(height: 30),
                      const Expanded(
                        flex: 1,
                        child: TabBar(
                          labelColor: Colors.white,
                          indicatorColor: Colors.white,
                          tabs: [
                            Tab(text: "Sign in"),
                            Tab(text: "Sign up"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Expanded(
                        flex: 6,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: TabBarView(
                            children: [
                              loginForm(
                                  context, passwordController, emailController),
                              registerForm(
                                context,
                                nameController,
                                surnameController,
                                emailController,
                                passwordController,
                                confirmPasswordController,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
