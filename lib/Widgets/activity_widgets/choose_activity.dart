import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SelectActivity extends StatefulWidget {
  SelectActivity({super.key, required this.isWalk, required this.callback});
  
  bool isWalk;
  Function(bool) callback;

  @override
  State<SelectActivity> createState() => _SelectActivityState();
}

class _SelectActivityState extends State<SelectActivity> {
  final List<bool> isSelected = [true, false];
  
  @override
  void initState() {
    super.initState();
    widget.isWalk = isSelected[0];  
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.transparent,
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
            widget.isWalk = isSelected[0];
            widget.callback(isSelected[0]);
          });
        },
        children: <Widget>[
          SizedBox(
            width: (MediaQuery.of(context).size.width - 60) / 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(
                  Icons.directions_run,
                  color: Colors.white,
                  size: 30,
                ),
                Text(
                  'Sprint',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width - 60) / 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(
                  Icons.directions_bike,
                  color: Colors.white,
                  size: 30,
                ),
                Text(
                  'Cycling',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
