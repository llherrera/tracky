import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:tracky/Data/activity.dart';
import '../Data/user.dart';
import 'package:get/get.dart';
import '../Data/user_model.dart';
import 'profile_page.dart';
import 'leadboard_page.dart';
import 'historial_page.dart';
import '../Widgets/home_widgets/addActivity_button.dart';
import '../Widgets/home_widgets/lastActivity_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Leaderboard(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
          Color(0xFF4093CE),
          Color(0xFF9BCEF3),
          ]
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          margin:
            const EdgeInsets.only(top: 30, right: 20, left: 20, bottom: 10),
          child: _widgetOptions.elementAt(_selectedIndex)
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          iconSize: 20,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Color(0xFF2F7694)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard, color: Color(0xFF2F7694)),
              label: 'Leaderboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, color: Color(0xFF2F7694)),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var boxUser = Hive.box<UserM>('userss');
    var boxAct = Hive.box<Activity>('activitiess');
    final UserProvider userP = Provider.of<UserProvider>(context, listen: false);
    final UserM? userLog = boxUser.get(userP.user!.key);
    final Iterable<dynamic> act = boxAct.values.where((element) => element.userName == userLog?.name);
    final List activities = act.toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Welcome ${userLog?.name ?? 'User'}!',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
            const Icon(
              Icons.person,
              color: Colors.white,
              size: 40,
            )
          ],
        ),
        const Text(
          "Let's exercise your day!",
          style: TextStyle(color: Colors.white, fontSize: 20),
          textAlign: TextAlign.right,
        ),
        const AddActivityButton(),
        const SizedBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Last Activity',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            TextButton(
              onPressed: () {Get.to(() => const HistorialPage());},
              child: const Text(
                'View all',
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  fontSize: 15
                ),
              ),
            ),
          ],
        ),
        if (activities.isEmpty) ...[
          const Text('No activities yet', style: TextStyle(color: Colors.white, fontSize: 20),)
        ] else if (activities.length == 1) ...[
          LastActivityBtn(act: activities.last),
        ] else ...[
          LastActivityBtn(act: activities.last),
          LastActivityBtn(act: activities[activities.length - 2])
        ],
      ]
    );
  }
}
