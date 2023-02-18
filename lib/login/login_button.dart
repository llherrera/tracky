import 'package:flutter/material.dart';
import 'package:tracky/register/register_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final login_button = ElevatedButton(
      onPressed: () {},
      child: Text('Login',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold
        )
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
      ),
    );
    return login_button;
  }
}

class LoginForm extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(left: 20),
        child: Column(
          children: <Widget>[
            Text('Create an account',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold
              )
            ),
            form(),
            Spacer(flex: 1),
            LoginButton(),
            Spacer(flex: 1),
            SignupButton(),
          ]
        ),
      )
    );
  }
}

class form extends StatefulWidget {
  const form({super.key});

  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}