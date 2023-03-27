import 'package:flutter_test/flutter_test.dart';
import 'package:tracky/UI/login_page.dart';
import 'package:tracky/UI/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets("Elementos login_page", (WidgetTester tester) async {
    var loginpage = LoginPage(); // Carga el widget de login_page

    await tester.pumpWidget(
      MaterialApp(
        home: loginpage,
      ),
    );

    expect(find.text('Login info'), findsOneWidget);
    expect(find.text('-------------------------or-------------------------'),
        findsOneWidget);
    expect(find.text('Log in'), findsOneWidget);
    expect(find.text('Sign up'), findsOneWidget);
    expect(find.text('Forgot password?'), findsOneWidget);
    expect(find.text('Username'),
        findsOneWidget); //Buscar el HintText dentro del TextField
    expect(find.text('password'),
        findsOneWidget); //Buscar el HintText dentro del TextField
    expect(find.text('Keep me logged in'), findsOneWidget);

    var login = find.text('Log in'); //Guarda el widget de Log In
    await tester.tap(login); //Presiona el Widget de Log In
    await tester.pump(); //Espera unos Frames

    expect(find.text('Error'), findsOneWidget);
    expect(find.text('Please fill in all the fields'), findsOneWidget);
    expect(find.text('OK'), findsOneWidget);

    var return1 = find.text('OK'); //Busca el boton OK
    await tester.tap(return1); //Presiona el boton OK
    await tester.pump(); //Espera unos Frames

    //var loginwrite = find.text('Username');  //Buscar el HintText dentro del TextField
    //await tester.enterText(find.byType(loginwrite), 'ejemplo');
    //await tester.pump(); //Espera unos Frames
  });

  testWidgets("Elementos register_page", (WidgetTester tester) async {
    var signup = SignupPage(); // Carga el widget de login_page

    await tester.pumpWidget(
      MaterialApp(
        home: signup,
      ),
    );

    expect(find.text('Create Account'), findsOneWidget);
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('password'), findsOneWidget);
    expect(find.text('Sign up'), findsOneWidget);
    expect(find.text('----------or-----------'), findsOneWidget);
    expect(find.text('Log in'), findsOneWidget);

    var signed = find.text('Sign up'); //Guarda el widget de Log In
    await tester.tap(signed); //Presiona el Widget de Log In
    await tester.pump(); //Espera unos Frames

    expect(find.text('Error'), findsOneWidget);
    expect(find.text('Please fill in all the fields'), findsOneWidget);
    expect(find.text('OK'), findsOneWidget);

    var return1 = find.text('OK'); //Busca el boton OK
    await tester.tap(return1); //Presiona el boton OK
    await tester.pump(); //Espera unos Frames
  });
}
