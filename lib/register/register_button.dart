import 'package:flutter/material.dart';
import 'register_page.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    final signupBtn = OutlinedButton(
      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupPage()));},
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        side: const BorderSide(color: Colors.white, width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      ),
      child: const Text('Sign Up',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold
        )
      ),
    );

    return signupBtn;
  }
}
