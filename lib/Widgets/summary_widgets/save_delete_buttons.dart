import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracky/UI/home_page.dart';

class SaveActBtn extends StatelessWidget {
  const SaveActBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final btn = ElevatedButton(
      onPressed: () {Get.off(() => const HomePage());},
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
      onPressed: () {Get.off(() => const HomePage());},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.red,
      ),
      child: const Text(
          'Delete',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
    );

    return btn;
  }
}