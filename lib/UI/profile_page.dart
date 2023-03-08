import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const <Widget>[
        Text('Profile data', style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 10),),
        /*BackBtn(),
        Row(),
        EditProfileBtn(),
        Statistics(),
        LastActivity()*/
      ],
    );
  }
}