import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:tracky/UI/home_page.dart';

import '../../Data/activity.dart';
import '../../Data/user.dart';
import '../../Data/user_model.dart';

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
        var boxUser = Hive.box<UserM>('userss');
        var boxAct = Hive.box<Activity>('activitiess');
        final UserProvider userP = Provider.of<UserProvider>(context, listen: false);
        final UserM? userLog = boxUser.get(userP.user!.key);
        final Iterable<dynamic> act = boxAct.values.where((element) => element.userName == userLog?.name);
        final List activities = act.toList();
        boxAct.deleteAt(activities.last.key);
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