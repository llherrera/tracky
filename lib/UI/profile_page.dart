import 'package:flutter/material.dart';
import '../Widgets/home_widgets/lastActivity_button.dart';
import '../Widgets/profile_widgets/edit_out_buttons.dart';
import '../Widgets/profile_widgets/statistics_button.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SizedBox(height: 10,),
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
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const <Widget>[
            Expanded(
              child: EditProfileBtn(),
            ),
            SizedBox(width: 10),
            LogOutBtn(),
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
        const LastActivityBtn(),
      ],
    );
  }
}
