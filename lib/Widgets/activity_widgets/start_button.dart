import 'package:flutter/material.dart';
import '../../UI/summary_page.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const SummaryPage()));},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
        ),
        icon: const Icon(Icons.play_arrow, color: Colors.black),
        label: const Text('Start', style: TextStyle(color: Colors.black))
      ),
    );
  }
}