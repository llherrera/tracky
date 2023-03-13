import 'package:flutter/material.dart';

class EditarInfo extends StatefulWidget {
  const EditarInfo({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EditarInfoState createState() => _EditarInfoState();
}

class _EditarInfoState extends State<EditarInfo> {
  String? _name = '';
  String? _lastName = '';
  String? _age = '';
  String? _email = '';
  String? _telephone = '';
  double? _weight = 0.0;
  double? _height = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: const Color.fromARGB(255, 64, 147, 206),
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  children: <Widget>[
                    //FILA 1 - PARA EL ICONO DE VOLVER ATRÁS
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_back_ios_new_outlined,
                              size: 40),
                          color: Colors.white,
                          padding: const EdgeInsets.only(top: 5.0, left: 5.0),
                        ),
                        const SizedBox(height: 20.0, width: 230),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.logout, size: 40),
                          color: Colors.white,
                          padding: const EdgeInsets.only(top: 5.0, right: 5.0),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50.0),
                    // ROW 2
                    Row(
                      children: [
                        Column(
                          children: const [
                            Padding(padding: EdgeInsets.only(left: 20)),
                            Text(
                              'Tania',
                              style: TextStyle(
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Barranquilla, Atlantico',
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
                                color: const Color.fromARGB(255, 0, 0, 0),
                                onPressed: () {
                                  // TODO: implementar el foto upload
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 60.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      padding:
                          const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Inserte Nombre(s)'),
                            initialValue: _name,
                            onChanged: (value) {
                              setState(() {
                                _name = value;
                              });
                            },
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Inserte Apellido(s)'),
                            initialValue: _lastName,
                            onChanged: (value) {
                              setState(() {
                                _lastName = value;
                              });
                            },
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Inserte Email'),
                            initialValue: _email,
                            onChanged: (value) {
                              setState(() {
                                _email = value;
                              });
                            },
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Inserte Numero telefono'),
                            initialValue: _telephone,
                            onChanged: (value) {
                              setState(() {
                                _telephone = value;
                              });
                            },
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Inserte su peso'),
                            initialValue: _weight?.toString(),
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            onChanged: (value) {
                              setState(() {
                                _weight = double.tryParse(value);
                              });
                            },
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Inserte su estatura'),
                            initialValue: _height?.toString(),
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            onChanged: (value) {
                              setState(() {
                                _height = double.tryParse(value);
                              });
                            },
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Inserte su edad'),
                            initialValue: _age,
                            onChanged: (value) {
                              setState(() {
                                _age = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    // BOTON DE EDITAR
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            // Agregar funcionalidades del boton aqui
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
                    )
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
