import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Widgets/segments_widget/list_segment.dart';

class SaveSegment extends StatelessWidget {
  const SaveSegment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF4093CE),
                      Color(0xFF9BCEF3),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 30),
                    //FILA 1 - PARA EL ICONO DE VOLVER ATRÁS
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.arrow_back_ios_new_outlined,
                              size: 40),
                          color: Colors.white,
                          padding: const EdgeInsets.only(top: 5.0, left: 5.0),
                        ),
                      ],
                    ),
                    const SizedBox(height: 60),

                    //ROW 2 - ADD SEGMENTS TEXT
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: const [
                            Padding(padding: EdgeInsets.only(left: 50)),
                            Text(
                              'Add Segments',
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10.0),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
//ROW 3 - PROPERTIES SEARCH
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 70,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: const TextField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(),
                                labelText: 'Properties',
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 100.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    // ROW 4 - ORGANIZAR Y LLAMAR EL WIDGET DE LISTA DE SEGMENTOS
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const ListSegment(
                                key: ValueKey('list_segment')),
                          ),
                        ],
                      ),
                    ),

                    // ROW 5 - PARA LOS BOTONES DE GUARDAR Y ELIMINAR
                    const SizedBox(height: 70.0),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
