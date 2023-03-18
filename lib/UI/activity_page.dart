import 'package:flutter/material.dart';
import '../Widgets/activity_widgets/choose_activity.dart';
import '../Widgets/activity_widgets/start_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddActivity extends StatelessWidget {
  const AddActivity({super.key});

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
              const SelectActivity(),
              Container(
                height: 250,
                padding: const EdgeInsets.all(30.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: MapGoogle(
                    apiKey: 'AIzaSyDytj5l8LUaEZxcvCdV9LK3WDhIB3GiZ08',
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(37.77483, -122.41942), // San Francisco
                      zoom: 12,
                    ),
                    markers: {
                      const Marker(
                        markerId: MarkerId('marker1'),
                        position: LatLng(37.77483, -122.41942), // San Francisco
                        infoWindow: InfoWindow(title: 'Marker 1'),
                      ),
                    },
                  ),
                ),
              ),

              const SizedBox(height: 5),
              //Button
              const StartButton(),
            ],
          ),
        ));
  }
}

class MapGoogle extends StatelessWidget {
  final String apiKey;
  final CameraPosition initialCameraPosition;
  final Set<Marker> markers;

  const MapGoogle({
    super.key,
    required this.apiKey,
    required this.initialCameraPosition,
    required this.markers,
  });

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: initialCameraPosition,
      markers: markers,
      onMapCreated: (GoogleMapController controller) {},
    );
  }
}
