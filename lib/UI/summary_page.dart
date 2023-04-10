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
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};

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
    // ignore: no_leading_underscores_for_local_identifiers, non_constant_identifier_names
    Position? _StartSeg;
    // ignore: no_leading_underscores_for_local_identifiers, non_constant_identifier_names
    Position? _EndSeg;

    for(int i=0; i<_route.length; i++){
      _markers.add(
        Marker(
          markerId: MarkerId(i.toString()),
          position: LatLng(_route[i].latitude, _route[i].longitude),
          icon: BitmapDescriptor.defaultMarker,
          onTap: () {
            _StartSeg == null ? _StartSeg = _route[i] : _EndSeg = _route[i];
            print(_StartSeg.toString());
            print(_EndSeg.toString());
          },
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_StartSeg != null && _EndSeg != null){
            bool temp = false;
            List<Position> points = [];
            for (int i = 0; i < _route.length; i++) {
              if (_route[i] == _StartSeg || _route[i] == _EndSeg) {
                temp = !temp;
              }
              if (temp) {
                points.add(_route[i]);
              }
            }
            Segment s = Segment(_StartSeg!, _EndSeg!, points);
            var boxSegm = Hive.box<Segment>('segments');
            await boxSegm.add(s);
          }
        },
        child: const Icon(Icons.map),
      ),
      body: Container(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 60.0),
            //FILA 2 - PARA EL TITULO Y EL ICONO DE CRONOMETRO
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
            //FILA 3 - PARA EL NOMBRE DEL EJERCICIO
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
            // FILA 4 - PARA EL MAPA
            const SizedBox(height: 10.0),
            Container(
              height: 250,
              padding: const EdgeInsets.all(30.0),
              child: GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  _controller =controller;
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(_route.last.latitude, _route.last.latitude),
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
            // FILA 5 - PARA EL TEXTO DE KILOMETROS
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text(
                'M: ${act.getDistance().toString()} M',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              ),
            ),
            // FILA 6 - PARA EL TEXTO DE TIEMPO
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
            // FILA 7 - PARA LOS BOTONES DE GUARDAR Y ELIMINAR
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
                  Spacer(), // Añadir espacio entre botones
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
    );
  }
}
