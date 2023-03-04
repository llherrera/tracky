import 'package:flutter/material.dart';
import 'textfields.dart';
import 'checkbox.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Icon(Icons.account_circle, size: 40, color: Colors.white),
        UsernameField(),
        Padding(padding: EdgeInsets.only(bottom: 20)),
        Icon(Icons.email, size: 40, color: Colors.white),
        EmailField(),
        Padding(padding: EdgeInsets.only(bottom: 20)),
        Icon(Icons.lock, size: 40, color: Colors.white),
        PasswordField(),
        CheckBox()
      ]
    );
  }
}