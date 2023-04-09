import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:tracky/Data/activity.dart';
import '../../Data/user.dart';
import '../../Data/user_model.dart';
import '../../UI/summary_page.dart';

// ignore: must_be_immutable
class StartButton extends StatefulWidget {
  StartButton({super.key, required this.isWalk, required this.mapController});
  bool isWalk;
  GoogleMapController? mapController;
  @override
  State<StartButton> createState() => _StartButtonState();
}

const LocationSettings locationSettings = LocationSettings(
  accuracy: LocationAccuracy.high,
  distanceFilter: 5,
);

class _StartButtonState extends State<StartButton> {
  bool _isPressed = false;
  Activity? act;
  DateTime? start;
  DateTime? end;
  bool? typeA;
  // ignore: prefer_final_fields
  List<Position> _routeList = [];

  @override
  void initState() {
    super.initState();
  }

  StreamSubscription<Position>? positionStream;

  Future<void> _addAct() async {
    var boxUser = Hive.box<UserM>('userss');
    var boxAct = Hive.box<Activity>('activitiess');
    final UserProvider userP = Provider.of<UserProvider>(context, listen: false);
    final UserM? userLog = boxUser.get(userP.user!.key);
    if (!_isPressed){
      start = DateTime.now();
      typeA = widget.isWalk;
      positionStream = Geolocator.getPositionStream(locationSettings: locationSettings).listen(
        (Position? position) {
          if (position != null){
            _routeList.add(position);
            widget.mapController?.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(position.latitude, position.longitude),
                zoom: 17.0,
              ),
            ));
          }
      });
    } else {
      positionStream!.cancel();
      Activity a = Activity(start, DateTime.now(), typeA, userLog!.name, _routeList);
      await boxAct.add(a);
      Get.to(() => const SummaryPage());
    }
    setState(() {
      _isPressed = !_isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: (){
          _addAct();
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
          style: const TextStyle(color: Colors.white, fontSize: 25)
        )
      ),
    );
  }
}
