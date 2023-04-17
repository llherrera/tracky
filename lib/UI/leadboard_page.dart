import 'package:flutter/material.dart';
import '../Widgets/activity_widgets/choose_activity.dart';
import '../Widgets/leadboard_widgets/table_segments.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
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
        body: SingleChildScrollView(
          child:Column(
            children: <Widget>[
              const Icon(Icons.leaderboard, size: 100, color: Colors.white),
              const Text('Leaderboard', style: TextStyle(color: Colors.white, fontSize: 50)),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: SelectActivity(isWalk: true, callback: _setIsWalk,),
              ),
              const SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const TableSegments(),
              )
            ],
          ),
        ),
      )
    );
  }
}