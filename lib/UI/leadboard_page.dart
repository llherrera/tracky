import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Widgets/activity_widgets/choose_activity.dart';
import '../Widgets/leadboard_widgets/search_field.dart';
import '../Widgets/leadboard_widgets/table_segments.dart';
import 'save_segment.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  //const Leaderboard({super.key});
  // ignore: unused_field
  bool _isWalk = true;
  void _setIsWalk(bool isWalk) {
    setState(() {
      _isWalk = isWalk;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
          Color(0xFF4093CE),
          Color(0xFF9BCEF3),
          ]
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView( child:
          Column(
            children: <Widget>[
              const Icon(Icons.leaderboard, size: 100, color: Colors.white),
              const Text('Leaderboard', style: TextStyle(color: Colors.white, fontSize: 50)),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: SelectActivity(isWalk: true, callback: _setIsWalk,),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 20),
                child: const SearchField(),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const TableSegments(),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {Get.to(const SaveSegment());},
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
      )
    );
  }
}