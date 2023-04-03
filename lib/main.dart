import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'Data/activity.dart';
import 'Data/user.dart';
import 'Modelos/user_model.dart';
import 'UI/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserMAdapter());
  Hive.registerAdapter(ActivityAdapter());
  await Hive.openBox('users');
  //await Hive.openBox<MyModel>('myBox');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => User('Dios','Dios@email.com','1111')),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tracky',
      home: LoginPage(),
    );
  }
}