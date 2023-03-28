// Importa la Flutter Driver API
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Navegacion Pantalla Inicio', () {
    FlutterDriver driver;

    // Conéctate al driver de Flutter antes de ejecutar cualquier test
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Cierra la conexión con el driver después de que se hayan completado los tests
    //tearDownAll(() async {
    //if (driver != null) {
    //driver.close();
    //}
    //});

    final login = find.text('Log in');
    final llenar = find.text('Please fill in all the fields');
    //final error = find.text('Username or password is incorrect');
    final ok = find.text('Ok');
    test("Inicio sesion sin ingresar usuario y clave", () async {
      //await driver.waitFor(login);
      //await driver.tap(login);
      //await driver.waitFor(llenar);
      //await driver.tap(ok);
    });

    //test("Inicio sesion ingresando usuario y clave erroneos", () async {
    //Escribir en el usuario
    //await driver.waitFor(login);
    //await driver.tap(login);
    //await driver.waitFor(error);
    //await driver.tap(ok);
    //});
  });
}
