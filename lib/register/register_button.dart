import 'package:flutter/material.dart';
import 'package:tracky/login/login_button.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    final signup_button = OutlinedButton(
      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => SignupForm()));},
      child: Text('Sign Up',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold
        )
      ),
      style: OutlinedButton.styleFrom(
        primary: Colors.black,
        side: BorderSide(color: Colors.white, width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      ),
    );

    return signup_button;
  }
}

class SignupForm extends StatelessWidget {
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
            SignupButton(),
            Spacer(flex: 1),
            LoginButton()
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