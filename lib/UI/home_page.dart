import 'package:flutter/material.dart';
import 'package:tracky/UI/activity_page.dart';
import 'package:tracky/UI/leadboard_page.dart';
import 'package:tracky/UI/history_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Settings(),
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
            icon: Icon(Icons.settings, color: Colors.black),
            label: 'Settings',
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
      children: <Widget>[
        Container(
            margin: const EdgeInsets.only(top: 50),
            child: Row(
              children: [
                Flexible(
                  flex: 1 ,
                  child: Column(
                    children: const <Widget>[
                      Text('Welcolme', style: TextStyle(color: Colors.white),),
                      Text('@username', style: TextStyle(color: Colors.white),)
                    ],
                  )
                ),
                const Spacer(flex: 1),
                const Flexible(
                  flex: 1, 
                  child: Icon(
                    Icons.account_circle,
                    color: Colors.white
                  )
                ),
              ],
            )
          ),
        const Spacer(flex: 1),
        OutlinedButton.icon(
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const AddActivity()));},
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            side: const BorderSide(color: Colors.white, width: 2),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30)
          ),
          icon: const Icon(Icons.add_circle_outline, color: Colors.white, size: 50,),
          label: const Text(
            'Add Activity',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold
            )
          ),
        ),
        const Spacer(flex: 1),
        Row(
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
        ),
      ]
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Settings', style: TextStyle(color: Colors.white)),
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