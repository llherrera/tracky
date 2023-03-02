import 'package:flutter/material.dart';
import 'package:tracky/Widgets/register_button.dart';
import '../Widgets/login_button.dart';
import '../Widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 100),
              child: const Text('Log in',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold
                )
              ),
            ),
            const Spacer(flex: 1),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: const LoginForm()
            ),
            Container( 
              margin: const EdgeInsets.only(bottom: 20),
              child: const LoginButtonExp()
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 50),
              child: const SignupButton()
            ),
          ]
        ),
      )
    );
  }
}