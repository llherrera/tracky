import 'package:flutter/material.dart';
import '../../UI/login_page.dart';
import 'package:tracky/UI/home_page.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBtn = ElevatedButton(
      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
      ),
      child: const Text('Log in',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold
        )
      ),
    );
    return loginBtn;
  }
}

class LoginButtonExp extends StatelessWidget {
  const LoginButtonExp({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBtn = 
      ElevatedButton(
        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 20)
        ),
        child: const Text('Log in',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold
          )
        ),
      )
    ;
    return loginBtn;
  }
}

class LoginButtonOutlined extends StatelessWidget {
  const LoginButtonOutlined({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBtn = OutlinedButton(
      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));},
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        side: const BorderSide(color: Colors.white, width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      ),
      child: const Text('Log in',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold
        )
      ),
    );

    return loginBtn;
  }
}