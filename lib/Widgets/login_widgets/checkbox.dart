import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  const CheckBox({super.key});

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool _selected = false;
  
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
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
    );
  }
}