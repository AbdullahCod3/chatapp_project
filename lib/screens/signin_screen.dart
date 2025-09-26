import 'package:chatapp_project/constants.dart';
import 'package:chatapp_project/core/utils/custom_button.dart';
import 'package:chatapp_project/core/utils/custom_textbutton.dart';
import 'package:chatapp_project/core/utils/custom_textfield.dart';
import 'package:chatapp_project/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SigninScreen extends StatefulWidget {
  static const String screenRoute = 'signin_screen';
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(height: 180, child: Image.asset('images/logo.png')),
              SizedBox(height: 50),
              CustomTextfield(
                hint: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
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
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    if (user != null) {
                      Navigator.pushNamed(context, ChatScreen.screenRoute);
                      setState(() {
                        showSpinner = false;
                      });
                    }
                  } catch (e) {
                    print(e);
                  }
                },
              ),
              SizedBox(height: 8),
              CustomTextbutton(),
            ],
          ),
        ),
      ),
    );
  }
}
