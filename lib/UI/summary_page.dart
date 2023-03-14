import 'package:flutter/material.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  @override
  Widget build(BuildContext context) {
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
                  children: <Widget>[
                    //FILA 1 - PARA EL ICONO DE VOLVER ATRÁS
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_back_ios_new_outlined,
                              size: 30),
                          color: Colors.white,
                          padding: const EdgeInsets.only(top: 5.0, left: 10.0),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30.0),
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
                    Row(
                      children: const [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.0, right: 20),
                            child: Text(
                              'Running',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // FILA 4 - PARA EL MAPA
                    const SizedBox(height: 15.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            'assets/images/mapa.png',
                            height: MediaQuery.of(context).size.height * 0.25,
                          ),
                        ),
                      ],
                    ),

                    // FILA 5 - PARA EL TEXTO DE KILOMETROS
                    const SizedBox(height: 30.0),
                    Row(
                      children: const [
                        Padding(padding: EdgeInsets.only(left: 20)),
                        Text(
                          'Km: 90km',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    // FILA 6 - PARA EL TEXTO DE TIEMPO
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Padding(padding: EdgeInsets.only(left: 20)),
                        Text(
                          'Time: 2:00:00',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    // FILA 7 - PARA LOS BOTONES DE GUARDAR Y ELIMINAR
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Agregar funcionalidades del boton aqui
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 20),
                          ),
                          child: const Text(
                            'Save',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                            width: 10), // Añadir espacio entre botones
                        ElevatedButton(
                          onPressed: () {
                            // Agregar funcionalidades del botón aquí
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: Colors.red,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 20),
                          ),
                          child: const Text(
                            'Delete',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
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
