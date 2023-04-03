import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tracky/UI/activity_page.dart';
import '../Data/activity.dart';
import '../Data/user.dart';
import 'package:get/get.dart';

import '../Modelos/user_model.dart';

class Activitydetail extends StatefulWidget {
  const Activitydetail({super.key});
  @override
  State<Activitydetail> createState() => _ActivitydetailState();
}

class _ActivitydetailState extends State<Activitydetail> {

  GoogleMapController? _controller;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};

  @override
  Widget build(BuildContext context) {
    final UserProvider userP =
        Provider.of<UserProvider>(context, listen: false);
    final UserM? user = userP.user;
    final Activity act = user?.activities[user.activities.length - 1] ?? Activity(DateTime.now(), true);
    final differenceTime = act.dateEnd.difference(act.dateStart);
    final _route = act.routeList;

    for(int i=0; i<_route.length; i++){
      _markers.add(
        // added markers
        Marker(
            markerId: MarkerId(i.toString()),
          position: LatLng(_route[i].latitude, _route[i].longitude),
          /*infoWindow: InfoWindow(
            title: 'HOTEL',
            snippet: '5 Star Hotel',
          ),*/
          icon: BitmapDescriptor.defaultMarker,
        )
      );
      setState(() {
 
      });
      _polyline.add(
          Polyline(
            polylineId: PolylineId('1'),
            points: _route.map((e) => LatLng(e.latitude, e.longitude)).toList(),
            color: Colors.green,
          )
      );
    }

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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0, left: 10),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Get.back();
                        },
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0, left: 10),
                      child: Container(
                        alignment: Alignment.topCenter,
                        margin: const EdgeInsets.only(top: 20, bottom: 20),
                        child: const Text(
                          'Activity details',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Morning routine',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                const SizedBox(height: 15.0),
                Container(
                  height: 250,
                  padding: const EdgeInsets.all(30.0),
                  child: GoogleMap(
                    onMapCreated: (GoogleMapController controller) {
                      _controller =controller;
                    },
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(10.96854, -74.78132),
                      zoom: 14,
                    ),
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    zoomControlsEnabled: false,
                    mapType: MapType.normal,
                    compassEnabled: true,
                    markers: _markers,
                  ),
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    width: 300,
                    height: 230,
                    decoration: BoxDecoration(
                      color: const Color(0xCCFFFFFF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Type of activity:',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        Text(act.type! ? 'Running' : 'Cycling',
                            style:
                                const TextStyle(color: Colors.black, fontSize: 20)),
                        const Text('Date:',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        Text(act.dateStart.toString().substring(0 ,10),
                            style:
                                const TextStyle(color: Colors.black, fontSize: 20)),
                        const Text('Duration: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        Text(differenceTime.toString().substring(0, 7),
                            style:
                                const TextStyle(color: Colors.black, fontSize: 20)),
                        const Text('Distance: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        Text(act.getDistance().toString() +' km',
                            style:
                                const TextStyle(color: Colors.black, fontSize: 20)),
                      ],
                    ),
                  ),
                ),
              ]),
        ));
  }
}
