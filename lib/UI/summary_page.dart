import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tracky/Data/user.dart';
import '../Data/activity.dart';
import '../Modelos/user_model.dart';
import '../Widgets/summary_widgets/save_delete_buttons.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  GoogleMapController? _controller;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};

  @override
  Widget build(BuildContext context) {
    final UserProvider userP = Provider.of<UserProvider>(context, listen: false);
    final UserM? user = userP.user;
    final Activity act = user?.activities[user.activities.length - 1] ?? Activity(DateTime.now(), true);
    final differenceTime = act.getDuration();
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
            polylineId: const PolylineId('1'),
            points: _route.map((e) => LatLng(e.latitude, e.longitude)).toList(),
            color: Colors.green,
          )
      );
    }
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0xFF4093CE),
                      Color(0xFF9BCEF3),
                ])),
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 60.0),
                    //FILA 2 - PARA EL TITULO Y EL ICONO DE CRONOMETRO
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
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
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.timer_outlined, size: 40),
                          color: Colors.white,
                          padding: const EdgeInsets.only(top: 5.0, right: 10.0),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40.0),
                    //FILA 3 - PARA EL NOMBRE DEL EJERCICIO
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Text(act.type! ? 'Running' : 'Cycling',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    // FILA 4 - PARA EL MAPA
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
                    // FILA 5 - PARA EL TEXTO DE KILOMETROS
                    const SizedBox(height: 30.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Km: ${act.getDistance()} km',
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    // FILA 6 - PARA EL TEXTO DE TIEMPO
                    const SizedBox(height: 10),
                    Padding(padding: const EdgeInsets.only(left: 20),
                        child: 
                          Text('Time: ${differenceTime.toString().substring(0, 7)}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.white
                            ),
                        ),
                    ),
                    // FILA 7 - PARA LOS BOTONES DE GUARDAR Y ELIMINAR
                    const SizedBox(height: 40),
                    Row(
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
                    ),
                    const SizedBox(height: 100),
                    // EMPANADA.COM
                    Row(
                      children: [
                        Container(
                          color: const Color.fromARGB(255, 64, 147, 206),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      //resizeToAvoidBottomInset: true,
    );
  }
}
