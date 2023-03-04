import 'package:flutter/material.dart';
import '../Widgets/zCommon_widgets/backArrow_button.dart';
import '../Widgets/activity_widgets/choose_activity.dart';
import '../Widgets/activity_widgets/start_button.dart';

class AddActivity extends StatelessWidget {
  const AddActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin:const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            BackArrowBtn(),
            Text('Activity', style: TextStyle(color: Colors.white, fontSize: 30),),
            SelectActivity(),
            /*
              maps
            */
            StartButton()
          ],
        ),
      )
    );
  }
}
