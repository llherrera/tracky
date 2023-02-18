import 'package:flutter/material.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    final signup_button = OutlinedButton(
      onPressed: () {},
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