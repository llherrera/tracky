import 'package:flutter_test/flutter_test.dart';
import 'package:tracky/UI/login_page.dart';
import 'package:tracky/UI/register_page.dart';
import 'package:tracky/UI/home_page.dart';
import 'package:tracky/UI/activity_page.dart';
import 'package:tracky/UI/leadboard_page.dart';
import 'package:tracky/UI/profile_page.dart';
import 'package:tracky/UI/edit_profile_page.dart';
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
    var signup = SignupPage(); // Carga el widget de SignupPage

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

  testWidgets("Elementos home_page", (WidgetTester tester) async {
    var homepage = HomePage(); // Carga el widget de home_page

    await tester.pumpWidget(
      MaterialApp(
        home: homepage,
      ),
    );

    expect(find.text("Let's exercise your day!"), findsOneWidget);
    expect(find.text('Last Activity'), findsOneWidget);
    expect(find.text('View all'), findsOneWidget);
    expect(find.text('No activities yet'), findsOneWidget);
    expect(find.text('Add Activity'), findsOneWidget);
  });

  testWidgets("Elementos activity_page", (WidgetTester tester) async {
    var addactivity = AddActivity(); // Carga el widget de AddActivity

    await tester.pumpWidget(
      MaterialApp(
        home: addactivity,
      ),
    );

    expect(find.text('Type of activity'), findsOneWidget);
    expect(find.text('Sprint'), findsOneWidget);
    expect(find.text('Cycling'), findsOneWidget);
    expect(find.text('Start'), findsOneWidget);
    expect(find.text('Stop'), findsNothing); //Stop no debe aparecer

    //var startpress = find.text('Start'); //Guarda el boton de Start
    //await tester.tap(startpress); //Presiona el boton
    // await tester.pump(); //Espera unos Frames

    //expect(find.text('Stop'), findsOneWidget);
  });

  testWidgets("Elementos leadboard_page", (WidgetTester tester) async {
    var leader = Leaderboard(); // Carga el widget de Leaderboard

    await tester.pumpWidget(
      MaterialApp(
        home: leader,
      ),
    );

    expect(find.text('Leaderboard'), findsOneWidget);
    expect(find.text('Sprint'), findsOneWidget);
    expect(find.text('Cycling'), findsOneWidget);
    expect(find.text('Search'), findsOneWidget);
  });

  testWidgets("Elementos profile_page", (WidgetTester tester) async {
    var profile = Profile(); // Carga el widget de Profile

    await tester.pumpWidget(
      MaterialApp(
        home: profile,
      ),
    );

    expect(find.text('Barranquilla, Atlantico'), findsOneWidget);
    expect(find.text('Statistics'), findsOneWidget);
    expect(find.text('Last Activity'), findsOneWidget);
    expect(find.text('View all'), findsOneWidget);
    expect(find.text('Edit Profile'), findsOneWidget);
    expect(find.text('Log out'), findsOneWidget);
  });

  testWidgets("Elementos edit_profile_page", (WidgetTester tester) async {
    var editarinfo = EditarInfo(); // Carga el widget de EditarInfo

    await tester.pumpWidget(
      MaterialApp(
        home: editarinfo,
      ),
    );

    expect(find.text('Tania'), findsOneWidget);
    expect(find.text('Barranquilla,\nAtlantico'), findsOneWidget);
    expect(find.text('Inserte Nombre(s)'), findsOneWidget);
    expect(find.text('Inserte Apellido(s)'), findsOneWidget);
    expect(find.text('Inserte Email'), findsOneWidget);
    expect(find.text('Inserte Numero telefono'), findsOneWidget);
    expect(find.text('Inserte su peso'), findsOneWidget);
    expect(find.text('Inserte su estatura'), findsOneWidget);
    expect(find.text('Inserte su edad'), findsOneWidget);
  });
}
