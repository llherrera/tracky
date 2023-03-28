import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracky/Data/activity.dart';
import '../Widgets/activity_widgets/choose_activity.dart';
import '../Widgets/activity_widgets/start_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class AddActivity extends StatefulWidget {
  const AddActivity({super.key});

  @override
  State<AddActivity> createState() => _AddActivityState();
}

class _AddActivityState extends State<AddActivity> {
  bool _isWalk = true;
  Position _currentPosition = Position(longitude: -74.78132, latitude: 10.96854, timestamp: DateTime.now(), accuracy: 0, altitude: 0, heading: 0, speed: 0, speedAccuracy: 0);
  late GoogleMapController _mapController;

  void _getCurrentLocation() async {
    final position = await _determinatePosition();
    setState(() {
      _currentPosition = position;
    });
  }

  Future<Position> _determinatePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  void _setIsWalk(bool isWalk) {
    setState(() {
      _isWalk = isWalk;
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
        ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.topCenter,
                child: const Text(
                  'Type of activity',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SelectActivity(isWalk: _isWalk, callback: _setIsWalk),
              Container(
                height: 250,
                padding: const EdgeInsets.all(30.0),
                child: GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    _mapController = controller;
                    _getCurrentLocation();
                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(_currentPosition.latitude, _currentPosition.longitude),
                    zoom: 14,
                  ),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  zoomControlsEnabled: false,
                  mapType: MapType.normal,
                  compassEnabled: true,
                ),
              ),
              const SizedBox(height: 5),
              //Button
              StartButton(isWalk: _isWalk,),
            ],
          ),
        ));
  }
}
