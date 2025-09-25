import 'package:chatapp_project/constants.dart';
import 'package:chatapp_project/core/utils/custom_button.dart';
import 'package:chatapp_project/core/utils/custom_textbutton.dart';
import 'package:chatapp_project/core/utils/custom_textfield.dart';
import 'package:chatapp_project/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  static const String screenRoute = 'signin_screen';
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  late String email;
  late String password;
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
            CustomTextfield(
              hint: 'Enter your email',
              onChanged: (value) {
                email = value;
              },
            ),
            CustomTextfield(
              hint: 'Enter your password',
              onChanged: (value) {
                password = value;
              },
              obscureText: true,
            ),
            SizedBox(height: 20),
            CustomButton(
              title: 'Sign in',
              color: kPrimaryColor,
              onPressed: () {},
            ),
            CustomTextbutton(),
          ],
        ),
      ),
    );
  }
}
