import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import '../Data/activity.dart';
import 'package:get/get.dart';

import '../Data/segment.dart';

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
  final Set<Polyline> _polyline = {};
  double indexS = 0.0;
  double indexE = 1.0;
  RangeValues indexRange = const RangeValues(0, 1);
  // ignore: no_leading_underscores_for_local_identifiers
  Marker? _markersS;
  // ignore: no_leading_underscores_for_local_identifiers
  Marker? _markersE;
  Set<Marker> _markersSE = {};

  @override
  void initState() {
    super.initState();
    indexE = widget.act!.routeList.length - 1;
    indexRange = RangeValues(indexS, indexE);
  }

  @override
  Widget build(BuildContext context) {
    final differenceTime = widget.act!.getDuration();
    // ignore: no_leading_underscores_for_local_identifiers
    final _route = widget.act!.routeList;
    indexS = indexRange.start;
    indexE = indexRange.end;
    indexRange = RangeValues(indexS, indexE);
    _markersS = Marker(
      markerId: MarkerId(_route[indexRange.start.toInt()].toString()),
      position: LatLng(_route[indexRange.start.toInt()].latitude, _route[indexRange.start.toInt()].longitude),
      icon: BitmapDescriptor.defaultMarker,
    );
    _markersE = Marker(
      markerId: MarkerId(_route[indexRange.end.toInt()].toString()),
      position: LatLng(_route[indexRange.end.toInt()].latitude, _route[indexRange.end.toInt()].longitude),
      icon: BitmapDescriptor.defaultMarker,
    );
    _markersSE = { _markersS!, _markersE! };

    for(int i=0; i<_route.length; i++){
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            var boxseg = Hive.box<Segment>('segments');
            int startSegment = indexRange.start.toInt();
            int endSegment = indexRange.end.toInt();
            List<Position> segment = [];
            for(int i=startSegment; i<=endSegment; i++){
              segment.add(_route[i]);
            }
            Segment s = Segment(segment.first, segment.last, segment);
            boxseg.add(s);
          },
          backgroundColor: Colors.white,
          child: const Icon(Icons.add),
        ),
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
              const SizedBox(height: 10.0),
              Container(
                height: 250,
                padding: const EdgeInsets.all(30.0),
                child: GoogleMap(
                  gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                    Factory<OneSequenceGestureRecognizer>(
                      () => EagerGestureRecognizer(),
                    ),
                  },
                  onMapCreated: (GoogleMapController controller) {
                    _controller = controller;
                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(_route.last.latitude, _route.last.longitude),
                    zoom: 17,
                  ),
                  zoomControlsEnabled: false,
                  mapType: MapType.normal,
                  compassEnabled: true,
                  markers: _markersSE,
                  polylines: _polyline,
                )
              ),
              StatefulBuilder(
                builder: (BuildContext context, state) {
                  return RangeSlider(
                    values: indexRange,
                    divisions: _route.isEmpty ? 1 : _route.length - 1,
                    min: 0,
                    max: _route.length - 1,
                    onChanged: (values) {
                      state(() {
                        indexRange = values;
                        _markersS = Marker(
                          markerId: MarkerId(_route[values.start.toInt()].toString()),
                          position: LatLng(_route[values.start.toInt()].latitude, _route[values.start.toInt()].longitude),
                          icon: BitmapDescriptor.defaultMarker,
                        );
                        _markersE = Marker(
                          markerId: MarkerId(_route[values.end.toInt()].toString()),
                          position: LatLng(_route[values.end.toInt()].latitude, _route[values.end.toInt()].longitude),
                          icon: BitmapDescriptor.defaultMarker,
                        );
                        _markersSE = { _markersS!, _markersE! };
                      });
                      setState(() {
                      });
                    }
                  );
                },
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
                      Text('${widget.act!.getDistance()} M',
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
