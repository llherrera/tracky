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

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    const usernameField = TextField(
      obscureText: false,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Username',
        hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32))),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(32))
        )
      )
    );

    const passwordField = TextField(
      obscureText: false,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Password',
        hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32))),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(32))
        )
      )
    );

    return Column(
      children: <Widget>[
        const Icon(Icons.account_circle, size: 40, color: Colors.white),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: const <Widget>[
              usernameField,
            ]
          ),
        ),

        const Icon(Icons.lock, size: 40, color: Colors.white),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: const <Widget>[
              passwordField,
            ]
          ),
        ),
        Row(
          children: <Widget>[
            Checkbox(
              activeColor: Colors.black,
              checkColor:  Colors.white,
              side: const BorderSide(color: Colors.white),
              value: _selected,
              onChanged: (value) {
                setState( () {
                  _selected = value!;
                });
              },
            ),
            const Text('Keep me logged in',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15
              )
            )
          ]
        )
      ]
    );
  }
}