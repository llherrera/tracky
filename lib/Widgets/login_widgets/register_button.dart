import 'package:flutter/material.dart';
import '../../UI/home_page.dart';
import '../../UI/register_page.dart';

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

class SignupButtonElevated extends StatelessWidget {
  const SignupButtonElevated({super.key});

  @override
  Widget build(BuildContext context) {
    final signupBtn = ElevatedButton(
      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      ),
      child: const Text('Sign Up',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold
        )
      ),
    );

    return signupBtn;
  }
}
