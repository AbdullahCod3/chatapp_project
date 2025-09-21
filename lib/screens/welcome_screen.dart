import 'package:chatapp_project/constants.dart';
import 'package:chatapp_project/core/utils/custom_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const String screenRoute = 'welcome_screen';
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Container(height: 180, child: Image.asset('images/logo.png')),
                Text(
                  'MessageMe',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Colors.purple[900],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            CustomButton(
              title: 'Sign in',
              color: kPrimaryColor,
              onPressed: () {},
            ),
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
