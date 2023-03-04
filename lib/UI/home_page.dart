import 'package:flutter/material.dart';
import 'package:tracky/UI/activity_page.dart';
import 'package:tracky/UI/leadboard_page.dart';
import 'package:tracky/UI/history_page.dart';
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
    Scores(),
    Account(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: _widgetOptions.elementAt(_selectedIndex)
      ), 
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        iconSize: 40,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard, color: Colors.black),
            label: 'Scores',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Colors.black),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
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
      /**
       * userinfo
       * addActivity
       * ???
       */
      children: const <Widget>[
        UserInfo(),
        AddActivityButton(),
        Padding(padding: EdgeInsets.only(bottom: 20)),
        /*Row(
          children: [
            Flexible(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryPage()));}, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 80)
                ),
                child: Column(
                  children: const <Widget>[
                    Icon(Icons.history, color: Colors.black, size: 50,),
                    Text('History', style: TextStyle(color: Colors.black),)
                  ],
                ),
              )
            ),
            const Spacer(flex: 1),
            Flexible(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => PodiumPage()));}, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 90)
                ),
                child: Column(
                  children: const <Widget>[
                    Icon(Icons.leaderboard, color: Colors.black, size: 50,),
                    Text('Leaderboard', style: TextStyle(color: Colors.black),)
                  ],
                ),
              )
            ),
          ],
        ),*/
      ]
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Settin2gs', style: TextStyle(color: Colors.white)),
    );
  }
}

class Scores extends StatelessWidget {
  const Scores({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Scores', style: TextStyle(color: Colors.white)),
    );
  }
}

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Account', style: TextStyle(color: Colors.white)),
    );
  }
}