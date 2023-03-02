import 'package:flutter/material.dart';

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Icon(Icons.account_circle, size: 40, color: Colors.white),
        usernameField,
        const Padding(padding: EdgeInsets.only(bottom: 20)),
        const Icon(Icons.lock, size: 40, color: Colors.white),
        //const Padding(padding: EdgeInsets.only(bottom: 20)),
        passwordField,
        CheckboxListTile(
          value: _selected,
          onChanged: (value) {
            setState( () {
              _selected = value!;
            });
          },
          title: const Text('Keep me logged in', 
            style: TextStyle(color: Colors.white, fontSize: 15)),
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: Colors.black,
          checkColor: Colors.white,
          side: const BorderSide(color: Colors.white)
        )
      ]
    );
  }
}