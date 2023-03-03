import 'package:flutter/material.dart';
import 'package:tracky/Widgets/login_widgets/login_button.dart';
import '../Widgets/login_widgets/register_button.dart';
import '../Widgets/login_widgets/register_form.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: const Text('Create an account',
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
              child: const SignupForm()
            ),
            Container( 
              margin: const EdgeInsets.only(bottom: 20),
              child: const SignupButtonElevated()
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 50),
              child: const LoginButtonOutlined()
            ),
          ]
        ),
      )
    );
  }
}