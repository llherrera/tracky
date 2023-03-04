import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    var info = Container(
      margin: const EdgeInsets.only(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: const <Widget>[
              Text('Welcolme', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
              Text('@username', style: TextStyle(color: Colors.white, fontSize: 30),)
            ],
          ),
          const Icon(
            Icons.account_circle,
            size: 60,
            color: Colors.white
          )
        ],
      )
    );



    return info;
  }
}