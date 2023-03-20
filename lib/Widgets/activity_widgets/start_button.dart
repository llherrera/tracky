import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tracky/Data/activity.dart';
import '../../Data/user.dart';
import '../../UI/summary_page.dart';

class StartButton extends StatefulWidget {
  StartButton({super.key, required this.isWalk});
  bool isWalk;

  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
          onPressed: () {
            if (!_isPressed){
              final UserProvider userP = Provider.of<UserProvider>(context, listen: false);
              final User? user = userP.user;
              Activity act = Activity();
              act.setType(widget.isWalk);
              user?.addActivity(act);
              act.dateStart = DateTime.now();
            } else {
              final UserProvider userP = Provider.of<UserProvider>(context, listen: false);
              final User? user = userP.user;
              Activity act = user?.getActivity;
              act.dateEnd = DateTime.now();
              user?.updateActivity(act);
              Get.to(() => const SummaryPage());
            }
            setState(() {
              _isPressed = !_isPressed;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: _isPressed ? Colors.red : Colors.green,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            minimumSize: const Size(180, 60),
          ),
          icon: Icon(
            _isPressed ? Icons.stop : Icons.play_arrow,
            color: Colors.white,
            size: 35,
          ),
          label: Text(_isPressed ? 'Stop':'Start',
              style: const TextStyle(color: Colors.white, fontSize: 25))),
    );
  }
}
