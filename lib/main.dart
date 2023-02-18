import 'package:flutter/material.dart';
import 'login/login_button.dart';
import 'register/register_button.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Tracky',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 100),
              child: Text('Tracky',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold
                )
              ),
            )
          ),
          Spacer(flex: 5),
          Center( child: LoginButton() ),
          Spacer(flex: 1),
          Container( 
            margin: EdgeInsets.only(bottom: 50),
            child:Center(
              child: SignupButton()
            )
          )
        ],
      )
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(),
      ),
    );
  }
}
