import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../Data/activity.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Activitydetail extends StatefulWidget {
  Activitydetail({super.key, required this.act});
  Activity? act;

  @override
  State<Activitydetail> createState() => _ActivitydetailState();
}

class _ActivitydetailState extends State<Activitydetail> {

  // ignore: unused_field
  GoogleMapController? _controller;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};

  @override
  Widget build(BuildContext context) {
    final differenceTime = widget.act!.getDuration();
    // ignore: no_leading_underscores_for_local_identifiers
    final _route = widget.act!.routeList;

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
          polylineId: const PolylineId('1'),
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
                  padding: const EdgeInsets.only(top: 40.0, left: 10),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {Get.back();},
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
                        fontWeight: FontWeight.bold
                      ),
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
                  _controller = controller;
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(_route.last.latitude, _route.last.longitude),
                  zoom: 17,
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                zoomControlsEnabled: false,
                mapType: MapType.normal,
                compassEnabled: true,
                markers: _markers,
                polylines: _polyline,
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
                        fontWeight: FontWeight.bold
                      )
                    ),
                    Text(widget.act!.type! ? 'Running' : 'Cycling',
                      style: const TextStyle(color: Colors.black, fontSize: 20)
                    ),
                    const Text('Date:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    Text(widget.act!.dateStart.toString().substring(0 ,10),
                      style: const TextStyle(color: Colors.black, fontSize: 20)
                    ),
                    const Text('Duration: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    Text(differenceTime.toString().substring(0, 7),
                      style:const TextStyle(color: Colors.black, fontSize: 20)
                    ),
                    const Text('Distance: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    Text('${widget.act!.getDistance()} KM',
                      style: const TextStyle(color: Colors.black, fontSize: 20)
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
        )
      )
    );
  }
}
