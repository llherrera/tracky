import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tracky/UI/activity_page.dart';
import '../Data/user.dart';
import 'package:get/get.dart';

class Activitydetail extends StatefulWidget {
  const Activitydetail({super.key});
  @override
  State<Activitydetail> createState() => _ActivitydetailState();
}

class _ActivitydetailState extends State<Activitydetail> {
  @override
  Widget build(BuildContext context) {
    final UserProvider userP =
        Provider.of<UserProvider>(context, listen: false);
    final User? user = userP.user;

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
                /*MapGoogle(apiKey: 'AIzaSyDytj5l8LUaEZxcvCdV9LK3WDhIB3GiZO8',
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(37.77483, -122.41942), // San Francisco
                      zoom: 12), markers: {
                      const Marker(
                        markerId: MarkerId('marker1'),
                        position: LatLng(37.77483, -122.41942), // San Francisco
                        infoWindow: InfoWindow(title: 'Marker 1'),
                      ),
                    },),*/
                const SizedBox(height: 15.0),
                Center(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/mapa.png',
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width * 0.9,
                      )),
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
                      children: const [
                        Text('Type of activity:',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        Text('Running',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                        Text('Date:',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        Text('March 21, 2023 ',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                        Text('Duration: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        Text('50min ',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                        Text('Distance: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        Text('5kms ',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ],
                    ),
                  ),
                ),
              ]),
        ));
  }
}
