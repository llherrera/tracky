import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:tracky/UI/home_page.dart';

import '../../Data/activity.dart';

class SaveActBtn extends StatelessWidget {
  const SaveActBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final btn = ElevatedButton(
      onPressed: () {Get.to(() => const HomePage());},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.green,
      ),
      child: const Text(
        'Save',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white),
      ),
    );
    return btn;
  }
}

class DeleteActBtn extends StatelessWidget {
  const DeleteActBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final btn = ElevatedButton(
      onPressed: () {
        var boxAct = Hive.box<Activity>('activitiess');
        boxAct.deleteAt(boxAct.length - 1);
        Get.to(() => const HomePage());
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        backgroundColor: Colors.red,
      ),
      child: const Text(
        'Delete',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
      ),
    );

    return btn;
  }
}