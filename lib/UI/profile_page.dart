import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Data/user.dart';
import '../Widgets/home_widgets/lastActivity_button.dart';
import '../Widgets/profile_widgets/edit_out_buttons.dart';
import '../Widgets/profile_widgets/statistics_button.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final UserProvider userP = Provider.of<UserProvider>(context);
    final User? user = userP.user;
    
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
              children: <Widget>[
                Text(
                  '${user?.getUsername ?? 'User'}',
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                ),
                const Text(
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
        if (user?.activities.length == 0)...[
          const Text('No activities yet', style: TextStyle(color: Colors.white, fontSize: 20),)
        ]
        else ...[
          const LastActivityBtn(),
        ] 
      ],
    );
  }
}
