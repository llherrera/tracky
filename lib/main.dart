import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'Data/activity.dart';
import 'Data/user.dart';
import 'Modelos/activity_model.dart';
import 'Modelos/user_model.dart';
import 'UI/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(ActivityMAdapter());
  Hive.registerAdapter(UserMAdapter());
  await Hive.initFlutter();
  //await Hive.openBox<MyModel>('myBox');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => User('Dios','Dios@email.com','1111')),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => Activity()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tracky',
      home: LoginPage(),
    );
  }
}

