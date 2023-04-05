import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:tracky/Widgets/profile_widgets/edit_user_form.dart';
import 'home_page.dart';

class EditarInfo extends StatefulWidget {
  const EditarInfo({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EditarInfoState createState() => _EditarInfoState();
}

class _EditarInfoState extends State<EditarInfo> {
  // ignore: unused_field
  late File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {}
    });
  }

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
                          onPressed: () {Get.back();},
                          icon: const Icon(Icons.arrow_back_ios_new_outlined,
                              size: 40),
                          color: Colors.white,
                          padding: const EdgeInsets.only(top: 5.0, left: 5.0),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50.0),
                    // ROW 2
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: const [
                            Padding(padding: EdgeInsets.only(left: 20)),
                            Text(
                              'Tania',
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Barranquilla,\nAtlantico',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(width: 15.0),
                        Column(
                          children: [
                            Container(
                              width: 130,
                              height: 130,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.photo_camera, size: 70),
                                onPressed: () async {
                                  final pickedFile = await ImagePicker()
                                      .pickImage(source: ImageSource.gallery);
                                  if (pickedFile != null) {
                                    setState(() {
                                      _image = File(pickedFile.path);
                                    });
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 60.0),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child:
                          const FormularioUsuario(), // llamamos al widget de edit_profile_page
                    ),

                    // BOTON DE EDITAR
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            Get.off(() => const HomePage());
                          },
                          style: OutlinedButton.styleFrom(
                            shape: const StadiumBorder(),
                            side: const BorderSide(
                                width: 3.0, color: Colors.white),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Editar Perfil',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 20),
                              Icon(Icons.edit, color: Colors.white, size: 30),
                            ],
                          ),
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
    );
  }
}
