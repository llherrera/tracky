import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../UI/edit_profile_page.dart';
import '../../UI/login_page.dart';

class EditProfileBtn extends StatelessWidget {
  const EditProfileBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.white, width: 2),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      onPressed: () {Get.to(() => const EditarInfo());},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const <Widget>[
          Text(
            'Edit Profile',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Icon(
            Icons.edit,
            color: Colors.white,
            size: 40,
          ),
        ],
      ),
    );
  }
}

class LogOutBtn extends StatelessWidget {
  const LogOutBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.red, width: 2),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      onPressed: () {
        Get.off(() => const LoginPage());
      },
      child: Row(
        children: const <Widget>[
          Text(
            'Log out',
            style: TextStyle(color: Colors.red, fontSize: 20),
          ),
          Icon(
            Icons.logout,
            color: Colors.red,
            size: 40,
          ),
        ],
      ),
    );
  }
}