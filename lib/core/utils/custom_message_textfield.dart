import 'package:chatapp_project/constants.dart';
import 'package:flutter/material.dart';

class CustomMessageTextfield extends StatelessWidget {
  const CustomMessageTextfield({
    super.key,
    this.onChanged,
    required this.buttonText,
    required this.hintText,
    this.onPressed,
    this.controller,
  });
  final void Function(String)? onChanged;
  final void Function()? onPressed;
  final String buttonText;
  final String hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: kPrimaryColor, width: 2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                hintText: hintText,
                border: InputBorder.none,
              ),
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
