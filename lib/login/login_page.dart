import 'package:flutter/material.dart';
import 'package:tracky/register/register_button.dart';
import 'login_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const <Widget>[
            Text('Log in',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold
              )
            ),
            Icon(Icons.account_circle, size: 200, color: Colors.white),
            Spacer(flex: 1),
            LoginButtonExp(),
            SignupButton(),
          ]
        ),
      )
    );
  }
}

class form extends StatelessWidget {
  const form({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}