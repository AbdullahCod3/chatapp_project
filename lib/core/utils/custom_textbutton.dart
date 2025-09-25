import 'package:chatapp_project/constants.dart';
import 'package:chatapp_project/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class CustomTextbutton extends StatelessWidget {
  const CustomTextbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Don't have an account?"),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RegistrationScreen.screenRoute);
          },
          child: Text(
            'Create one',
            style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
