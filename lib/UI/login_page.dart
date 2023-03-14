import 'package:flutter/material.dart';
import '../Widgets/login_widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        //Degradado background
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xFF4093CE),
              Color(0xFF9BCEF3),
            ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const ClipRect(
                child: Align(
                  alignment: Alignment.topCenter,
                  heightFactor: 1,
                  widthFactor: 1,
                  child: Image(
                    image: AssetImage('assets/images/testee.png'),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Text(
                  'Tracky',
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFFE5E5E5),
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: const LoginForm(),
                  )),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
            ],
          ),
        ));
  }
}
