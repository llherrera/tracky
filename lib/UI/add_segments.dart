import 'package:flutter/material.dart';

class AddSegment extends StatelessWidget {
  const AddSegment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF4093CE),
            Color(0xFF9BCEF3),
          ]
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text('Add segment', style: TextStyle(color: Colors.white, fontSize: 30),),
            /**
             * textField 
             * ListView*/
          ],
        ),
      )
    );
  }
}