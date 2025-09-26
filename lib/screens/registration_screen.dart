import 'package:chatapp_project/constants.dart';
import 'package:chatapp_project/core/utils/custom_button.dart';
import 'package:chatapp_project/core/utils/custom_textfield.dart';
import 'package:chatapp_project/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  static const String screenRoute = 'registrationScreen_screen';
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(height: 20),
              CustomButton(
                title: 'Register',
                color: kPrimaryColor,
                onPressed: () async {
                  // print(email);
                  // print(password);
                  setState(() {
                    showSpinner = true;
                  });

                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    Navigator.pushNamed(context, ChatScreen.screenRoute);
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
