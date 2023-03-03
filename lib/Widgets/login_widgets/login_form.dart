import 'package:flutter/material.dart';
import 'username_field.dart';
import 'password_field.dart';
import 'checkbox.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Icon(Icons.account_circle, size: 40, color: Colors.white),
        UsernameField(),
        Padding(padding: EdgeInsets.only(bottom: 20)),
        Icon(Icons.lock, size: 40, color: Colors.white),
        PasswordField(),
        CheckBox()
      ]
    );
  }
}