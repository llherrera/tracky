import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../UI/login_page.dart';
import '../../UI/home_page.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const <Widget>[
        UsernameField(),
        EmailField(),
        PasswordField(),
        SignupButton(),
        Center(child: Text('----------or-----------')),
        LoginButton(),
//        ElevatedButton(onPressed: onPressed, child: child)
      ],
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      //obscureText: false,
      style: TextStyle(color: Color(0xFF505050)),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail, color: Color(0xFF505050)),
        hintText: 'Username',
        hintStyle: TextStyle(color: Color(0xFF505050)),
      )
    );
  }
}

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    final btn = ElevatedButton(
      onPressed: () {Get.off(() => const HomePage());},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2F7694),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
      ),
      child: const Text('Sign up',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold
        )
      ),
    );
    return btn;
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final btn = ElevatedButton(
      onPressed: () {Get.off(() => const LoginPage());},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
      ),
      child: const Text('Log in',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold
        )
      ),
    );
    return btn;
  }
}

class UsernameField extends StatelessWidget {
  const UsernameField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      //obscureText: false,
      style: TextStyle(color: Color(0xFF505050)),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person, color: Color(0xFF505050)),
        hintText: 'Username',
        hintStyle: TextStyle(color: Color(0xFF505050)),
      )
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      obscureText: true,
      style: TextStyle(color: Color(0xFF505050)),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person, color: Color(0xFF505050)),
        hintText: 'password',
        hintStyle: TextStyle(color: Color(0xFF505050)),
      )
    );
  }
}