import 'package:flutter/material.dart';

class FormularioUsuario extends StatefulWidget {
  const FormularioUsuario({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FormularioUsuarioState createState() => _FormularioUsuarioState();
}

class _FormularioUsuarioState extends State<FormularioUsuario> {
  String? _name;
  String? _lastName;
  String? _email;
  String? _telephone;
  double? _weight;
  double? _height;
  String? _age;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(labelText: 'Inserte Nombre(s)'),
            initialValue: _name,
            onChanged: (value) {
              setState(() {
                _name = value;
              });
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Inserte Apellido(s)'),
            initialValue: _lastName,
            onChanged: (value) {
              setState(() {
                _lastName = value;
              });
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Inserte Email'),
            initialValue: _email,
            onChanged: (value) {
              setState(() {
                _email = value;
              });
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration:
                const InputDecoration(labelText: 'Inserte Numero telefono'),
            initialValue: _telephone,
            onChanged: (value) {
              setState(() {
                _telephone = value;
              });
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Inserte su peso'),
            initialValue: _weight?.toString(),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onChanged: (value) {
              setState(() {
                _weight = double.tryParse(value);
              });
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Inserte su estatura'),
            initialValue: _height?.toString(),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onChanged: (value) {
              setState(() {
                _height = double.tryParse(value);
              });
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Inserte su edad'),
            initialValue: _age,
            onChanged: (value) {
              setState(() {
                _age = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
