import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tracky/Data/activity.dart';
import '../../Data/user.dart';
import '../../UI/summary_page.dart';

const LocationSettings locationSettings = LocationSettings(
  accuracy: LocationAccuracy.high,
  distanceFilter: 100,
);

class StartButton extends StatefulWidget {
  StartButton({super.key, required this.isWalk});
  bool isWalk;

  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  bool _isPressed = false;
  List<Position> _routeList = [];

  @override
  void initState() {
    super.initState();
  }

  StreamSubscription<Position>? positionStream;

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
              positionStream = Geolocator.getPositionStream(locationSettings: locationSettings).listen(
                (Position? position) {
                  if (position != null){
                    _routeList.add(position);
                  }
              });
              act.dateStart = DateTime.now();
              user?.addActivity(act);
            } else {
              final UserProvider userP = Provider.of<UserProvider>(context, listen: false);
              final User? user = userP.user;
              Activity act = user?.getActivity;
              act.dateEnd = DateTime.now();
              act.routeList = _routeList;
              user?.updateActivity(act);
              positionStream!.cancel();
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
