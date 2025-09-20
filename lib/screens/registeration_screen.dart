import 'package:chatapp_project/constants.dart';
import 'package:chatapp_project/core/utils/custom_button.dart';
import 'package:chatapp_project/core/utils/custom_textfield.dart';
import 'package:flutter/material.dart';

class RegisterationScreen extends StatefulWidget {
  const RegisterationScreen({super.key});

  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
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
              title: 'Register',
              color: kPrimaryColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
