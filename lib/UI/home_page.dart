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
          margin: const EdgeInsets.only(top: 30, right: 10, left: 10, bottom: 10),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text('Welcome Tania!', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
            Icon(Icons.person, color: Colors.white, size: 30,)
          ],
        ),
        const Text("Let's exercise your day!", style: TextStyle(color: Colors.white, fontSize: 30), textAlign: TextAlign.right,),
        const AddActivityButton(),
        Text('', style: TextStyle(color: Colors.white, fontSize: 20),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Last Activity', style: TextStyle(color: Colors.white, fontSize: 20),),
            TextButton(
              onPressed: () {},
              child: const Text(
                'View all',
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  fontSize: 15),),
            ),
          ],
        ),
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF1C5E85),
                Color(0xF05D8FAD),
              ]
            )
          ),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onPressed: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(padding: const EdgeInsets.only(top: 10, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text('10 May, 12:30 pm', style: TextStyle(color: Colors.white, fontSize: 10),),
                        Icon(Icons.settings, color: Colors.white, size: 20,),
                      ],
                    )
                  ),
                  const Padding(padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: Text('Route 20: 40 km', style: TextStyle(color: Colors.white),)
                  ),
                  const Padding(padding: EdgeInsets.only(top: 5, bottom: 10),
                    child: Text('Cycling', style: TextStyle(color: Color(0xFFADCEE1)),),
                  )
                ],
              ),
            ),
          )
        ),
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF1C5E85),
                Color(0xF05D8FAD),
              ]
            )
          ),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onPressed: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(padding: const EdgeInsets.only(top: 10, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text('10 May, 12:30 pm', style: TextStyle(color: Colors.white, fontSize: 10),),
                        Icon(Icons.settings, color: Colors.white, size: 20,),
                      ],
                    )
                  ),
                  const Padding(padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: Text('Route 20: 40 km', style: TextStyle(color: Colors.white),)
                  ),
                  const Padding(padding: EdgeInsets.only(top: 5, bottom: 10),
                    child: Text('Cycling', style: TextStyle(color: Color(0xFFADCEE1)),),
                  )
                ],
              ),
            ),
          )
        ),
      ]
    );
  }
}
