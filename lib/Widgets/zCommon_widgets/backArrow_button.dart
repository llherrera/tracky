import 'package:flutter/material.dart';

class BackArrowBtn extends StatelessWidget {
  const BackArrowBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final backBtn = Container(
      margin: const EdgeInsets.only(top: 20, left: 15),
      child: OutlinedButton.icon(
        onPressed: () {
          Navigator.pop(context);
        }, 
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20)
        ),
        icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.white),
        label: const Text(''),
      )
    );
    return backBtn;
  }
}