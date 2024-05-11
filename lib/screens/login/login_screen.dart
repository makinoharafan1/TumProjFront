import 'package:flutter/material.dart';
import 'package:puble_frontend/const/constant.dart';
import 'package:puble_frontend/screens/login/components/custom_text_field.dart';
import 'package:puble_frontend/screens/login/components/custom_button.dart';

import 'package:puble_frontend/screens/dashboard/dashboard_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  // text controllers
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: 480,
            width: 420,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [BoxShadow(
                color: Colors.black,
                spreadRadius: 1,
                blurRadius: 10,
              )],
            ),

            child: Column(
              children: [

                const SizedBox(height: 40,),

                const Text(
                  'Sign in',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),

                const SizedBox(height: 40,),

                //login textfield
                CustomTextField(
                  controller: loginController,
                  hintText: 'Enter login',
                  obscureText: false,
                ),

                const SizedBox(height: 20,),

                //password textfield
                CustomTextField(
                  controller: passwordController,
                  hintText: 'Enter password',
                  obscureText: true,
                ),
                
                const SizedBox(height: 70,),

                //button
                CustomButton(onTap:  () => { 
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const DashboardScreen()),)
                  },
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}
