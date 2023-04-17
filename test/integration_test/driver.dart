_
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:tracky/Data/activity.dart';
import 'package:tracky/Data/position.g.dart';
import 'package:tracky/Data/segment.dart';
import 'package:tracky/Data/user.dart';
import 'package:tracky/Data/user_model.dart';
import 'package:tracky/UI/login_page.dart';
import 'package:tracky/Data/activity.dart';
import 'package:tracky/Data/position.g.dart';
import 'package:tracky/Data/segment.dart';
import 'package:tracky/Data/user.dart';
import 'package:tracky/Data/user_model.dart';
import 'package:tracky/UI/login_page.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(PositionAdapter());
  Hive.registerAdapter(UserMAdapter());
  Hive.registerAdapter(ActivityAdapter());
  Hive.registerAdapter(SegmentAdapter());
  await Hive.initFlutter();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  enableFlutterDriverExtension();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Box box1;
  late Box box2;
  late Box box3;

  @override
  void initState() {
    super.initState();
    openBoxes();
  }

  Future<void> openBoxes() async {
    box1 = await Hive.openBox<UserM>('userss');
    box2 = await Hive.openBox<Activity>('activitiess');
    box3 = await Hive.openBox<Segment>('segments');
  }

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tracky',
      home: LoginPage(),
    );
  }
}

