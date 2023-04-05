import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../Data/user.dart';
import '../Modelos/user_model.dart';
import '../Widgets/activity_widgets/choose_activity.dart';
import '../Widgets/home_widgets/lastActivity_button.dart';

class HistorialPage extends StatefulWidget {
  const HistorialPage({super.key});

  @override
  State<HistorialPage> createState() => _HistorialPageState();
}

class _HistorialPageState extends State<HistorialPage> {
  bool _isWalk = true;

  void _setIsWalk(bool isWalk) {
    setState(() {
      _isWalk = isWalk;
    });
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userP =
        Provider.of<UserProvider>(context, listen: false);
    final UserM? user = userP.user;

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
        body: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {Get.back();},
                    color: Colors.white,
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  child: const Text(
                    'Last activity',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
            SelectActivity(isWalk: _isWalk, callback: _setIsWalk),
            if (user!.activities.isEmpty) ...[
              const Text(
                'No activities yet',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
            ] else ...[
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                reverse: true,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: user.activities.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(
                      top: 10, left: 20, right: 20
                    ),
                    child: LastActivityBtn(act: user.activities[index])
                  );
                }
              )
            ]
          ]
        ))
      ),      
    );
  }
}
