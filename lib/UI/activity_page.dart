import 'package:flutter/material.dart';
import '../Widgets/activity_widgets/choose_activity.dart';
import '../Widgets/activity_widgets/start_button.dart';

class AddActivity extends StatelessWidget {
  const AddActivity({super.key});

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
            ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //const BackArrowBtn(),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 40,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                child: const Text(
                  'Type of activity',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ),
              //electionButton
              Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: const SelectActivity(),
                  )),

              //maps
              Container(
                padding: EdgeInsets.all(30.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/mapa_start.png',
                    width: 200,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //Button
              Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: const StartButton(),
                  )),
            ],
          ),
        ));
  }
}
