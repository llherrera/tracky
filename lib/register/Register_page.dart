import 'package:flutter/material.dart';
import 'package:tracky/login/login_button.dart';
import 'register_button.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: const EdgeInsets.only(left: 20),
        child: Column(
          children: const <Widget>[
            Text('Create an account',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold
              )
            ),
            Spacer(flex: 1),
            SignupButton(),
            Spacer(flex: 1),
            LoginButton()
          ]
        ),
      )
    );
  }
}