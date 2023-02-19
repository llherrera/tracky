import 'package:flutter/material.dart';
import 'login/login_button.dart';
import 'register/register_button.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Tracky',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 100),
              child: const Text('Tracky',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold
                )
              ),
            )
          ),
          const Spacer(flex: 5),
          const Center( child: LoginButton() ),
          const Spacer(flex: 1),
          Container( 
            margin: const EdgeInsets.only(bottom: 50),
            child: const Center(
              child: SignupButton()
            )
          )
        ],
      )
    );
  }
}
