import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:tracky/Data/segment.dart';
import 'package:tracky/Data/user.dart';
import '../Data/activity.dart';
import '../Data/user_model.dart';
import '../Widgets/summary_widgets/save_delete_buttons.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  // ignore: unused_field
  GoogleMapController? _controller;
  final Set<Polyline> _polyline = {};
  RangeValues indexRange = const RangeValues(0, 1);
  // ignore: no_leading_underscores_for_local_identifiers
  Marker? _markersS;
  // ignore: no_leading_underscores_for_local_identifiers
  Marker? _markersE;
  Set<Marker> _markersSE = {};

  @override
  Widget build(BuildContext context) {
    var boxUser = Hive.box<UserM>('userss');
    var boxAct = Hive.box<Activity>('activitiess');
    final UserProvider userP = Provider.of<UserProvider>(context, listen: false);
    final UserM? userLog = boxUser.get(userP.user!.key);
    final Iterable<dynamic> acts = boxAct.values.where((element) => element.userName == userLog?.name);
    final List activities = acts.toList();
    final Activity act = activities.last ?? Activity(DateTime.now(), DateTime.now(), true, userLog!.name, []);
    final differenceTime = act.getDuration();
    // ignore: no_leading_underscores_for_local_identifiers
    final _route = act.routeList;
    indexRange = RangeValues(0, _route.length - 1);
    _markersS = Marker(
      markerId: MarkerId(_route.first.toString()),
      position: LatLng(_route.first.latitude, _route.first.longitude),
      icon: BitmapDescriptor.defaultMarker,
    );
    _markersE = Marker(
      markerId: MarkerId(_route.last.toString()),
      position: LatLng(_route.last.latitude, _route.last.longitude),
      icon: BitmapDescriptor.defaultMarker,
    );
    _markersSE = { _markersS!, _markersE!};

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
          onPressed: () async {
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 60.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Summary',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -1.5,
                      ),
                    ),
                  ),
                  Icon(Icons.timer_outlined, size: 40, color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Text(act.type! ? 'Running' : 'Cycling',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
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
                  markers: _markersSE,
                  polylines: _polyline,
                ),
              ),
              const SizedBox(height: 10.0),
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
                        _markersSE = {_markersS!, _markersE!};
                      });
                      setState(() {

                      });
                    }
                  );
                },
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text(
                  'M: ${act.getDistance().toString()} M',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text('Time: ${differenceTime.toString().substring(0, 7)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.white
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Expanded(
                      flex: 4,
                      child: SaveActBtn(),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 4,
                      child: DeleteActBtn(),
                    )
                  ],
                )
              ),
            ],
          ),
        ),
      )
    );
  }
}
