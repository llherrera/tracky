import 'package:flutter/material.dart';
import 'package:tracky/Widgets/login_widgets/register_button.dart';
import '../Widgets/login_widgets/login_button.dart';

class Tracky extends StatelessWidget {
  const Tracky({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text('Tracky',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold
              )
            ),
            const Padding(padding: EdgeInsets.only(top: 40)),
            Column(
              children: const <Widget>[
                LoginButton(),
                Padding(padding: EdgeInsets.only(top: 30)),
                SignupButton()
              ]
            ),
          ],
        )
      )
    );
  }
}