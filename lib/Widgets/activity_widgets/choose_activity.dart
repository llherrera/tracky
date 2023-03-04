import 'package:flutter/material.dart';

class SelectActivity extends StatefulWidget {
  const SelectActivity({super.key});

  @override
  State<SelectActivity> createState() => _SelectActivityState();
}

class _SelectActivityState extends State<SelectActivity> {
  final List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ToggleButtons(
        borderRadius: BorderRadius.circular(20),
        selectedBorderColor: Colors.white,
        borderWidth: 2,
        isSelected: isSelected,
        onPressed: (int index) {
          setState(() {
            for (int i = 0; i < isSelected.length; i++) {
              isSelected[i] = i == index;
            }
          });
        },
        children: <Widget>[
          Row(
            children: const <Widget>[
              Icon(Icons.directions_run, color: Colors.white, size: 30,),
              Text('Sprint', style: TextStyle(color: Colors.white, fontSize: 20),),
            ],
          ),
          Row(
            children: const <Widget>[
              Icon(Icons.directions_bike, color: Colors.white, size: 30,),
              Text('Cycling', style: TextStyle(color: Colors.white, fontSize: 20),),
            ],
          ),
        ],
      )
    );
  }
}