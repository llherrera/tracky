import 'package:flutter/material.dart';
import '../../UI/activity_page.dart';

class AddActivityButton extends StatelessWidget {
  const AddActivityButton({super.key});

  @override
  Widget build(BuildContext context) {
    final addActBtn = OutlinedButton.icon(
      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const AddActivity()));},
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(50),
        side: const BorderSide(color: Colors.white, width: 2),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
      ),
      icon: const Icon(Icons.add_circle_outline, color: Colors.white, size: 100,),
      label: const Text(
        'Add Activity',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold
        )
      ),
    );
    return addActBtn;
  }
}