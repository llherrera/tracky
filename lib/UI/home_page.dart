import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'leadboard_page.dart';
import '../Widgets/home_widgets/user_info.dart';
import '../Widgets/home_widgets/addActivity_button.dart';

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
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF4093CE),
            Color(0xFF9BCEF3),
          ]
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
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
              label: 'Scores',
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const <Widget>[
        UserInfo(),
        AddActivityButton(),
        Padding(padding: EdgeInsets.only(bottom: 20)),
      ]
    );
  }
}
