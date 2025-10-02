import 'package:chatapp_project/constants.dart';
import 'package:chatapp_project/core/utils/custom_message_textfield.dart';
import 'package:chatapp_project/screens/welcome_screen.dart';
import 'package:chatapp_project/widgets/message_line.dart';
import 'package:chatapp_project/widgets/message_stream_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

final _firestore = FirebaseFirestore.instance;

class ChatScreen extends StatefulWidget {
  static const String screenRoute = 'chat_screen';
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  late User signedInUser; // this will give us user's email
  String? messageText; // message var
  bool showSpinner = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    final user = _auth.currentUser;
    try {
      if (user != null) {
        signedInUser = user;
        print(signedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: Row(
          children: [
            Image.asset('images/logo.png', height: 30),
            SizedBox(width: 10),
            Text('MessageMe', style: TextStyle(color: Colors.white)),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              //Add here logout function
              _auth.signOut();
              Navigator.pop(context);
            },
            icon: Icon(Icons.close, size: 30),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MessageStreamBuilder(currentUser: signedInUser.email!),
            CustomMessageTextfield(
              controller: messageTextController,
              buttonText: 'Send',
              hintText: 'Write your message here...',
              onChanged: (value) {
                messageText = value;
              },
              onPressed: () {
                messageTextController.clear();
                _firestore.collection('messages').add({
                  'text': messageText,
                  'sender': signedInUser.email,
                  'time': FieldValue.serverTimestamp(),
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
