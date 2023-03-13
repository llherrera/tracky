import 'package:flutter/material.dart';
import '../../UI/summary_page.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SummaryPage()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 15, 176, 31),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            minimumSize: const Size(180, 60),
          ),
          icon: const Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: 35,
          ),
          label: const Text('Start',
              style: TextStyle(color: Colors.white, fontSize: 25))),
    );
  }
}
