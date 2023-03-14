import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'UI/login_page.dart';
import 'UI/summary_page.dart';

void main() {
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Tracky',
    home: LoginPage(),
  ));
}
