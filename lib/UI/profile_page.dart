import 'package:flutter/material.dart';
import 'edit_profile_page.dart';
import 'dart:math' as math;

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  'Tania',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                Text(
                  'Barranquilla, Atlantico',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/user-icon.png'),
            ),
            //const SizedBox(width: 20),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white, width: 2),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditarInfo()));
                },
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
                    //SizedBox(width: 10),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.red, width: 2),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              onPressed: () {},
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
                  //SizedBox(width: 10),
                ],
              ),
            ),
          ],
        ),
        const Text(''),
        const Text(''),
        const Text(
          'Statistics',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        const Statistics(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              'Last Activity',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'View all',
                style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    fontSize: 15),
              ),
            ),
          ],
        ),
        const LastActivity(),
      ],
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 180 * math.pi / 180,
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.logout,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF1C5E85),
                  Color(0xF05D8FAD),
                ])),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          onPressed: () {},
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //Padding(padding: const EdgeInsets.symmetric(vertical: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 10),
                      child: Text(
                        'Cycling',
                        style: TextStyle(color: Color(0xFFADCEE1)),
                      ),
                    ),
                    Text(
                      'Best time: 40:00',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      'Distance: 20 km',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      'Date: March 8, 2022',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
                //Padding(padding: const EdgeInsets.symmetric(vertical: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 10),
                      child: Text(
                        'Running',
                        style: TextStyle(color: Color(0xFFADCEE1)),
                      ),
                    ),
                    Text(
                      'Best time: 40:00',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      'Distance: 20 km',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      'Date: March 8, 2022',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

class LastActivity extends StatelessWidget {
  const LastActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF1C5E85),
                  Color(0xF05D8FAD),
                ])),
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
                Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text(
                          '10 May, 12:30 pm',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 20,
                        ),
                      ],
                    )),
                const Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      'Route 20: 40 km',
                      style: TextStyle(color: Colors.white),
                    )),
                const Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                  child: Text(
                    'Cycling',
                    style: TextStyle(color: Color(0xFFADCEE1)),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
