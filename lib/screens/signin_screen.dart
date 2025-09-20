import 'package:chatapp_project/constants.dart';
import 'package:chatapp_project/core/utils/custom_button.dart';
import 'package:chatapp_project/core/utils/custom_textfield.dart';
import 'package:chatapp_project/screens/registeration_screen.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(height: 180, child: Image.asset('images/logo.png')),
            SizedBox(height: 50),
            CustomTextfield(hint: 'Enter your email', onChanged: (value) {}),
            CustomTextfield(hint: 'Enter your password', onChanged: (value) {}),
            SizedBox(height: 20),
            CustomButton(
              title: 'Sign in',
              color: kPrimaryColor,
              onPressed: () {},
            ),
            Row(
              children: [
                Text("Don't have an account?"),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterationScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Create one',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
