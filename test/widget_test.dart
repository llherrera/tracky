// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:tracky/Data/user.dart';
import 'package:tracky/UI/home_page.dart';
import 'package:tracky/UI/login_page.dart';

void main() {
  testWidgets('login user', (WidgetTester tester) async {
    
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => User('Dios','Dios@email.com','1111')),
          ChangeNotifierProvider(create: (context) => UserProvider()),
          //Provider<User>.value(value: User('Dios','Dios@email.com','1111')),
          //Provider<UserProvider>.value(value: UserProvider()),
        ],
        child: Builder(builder: (_) => const MaterialApp(
          home: Home()
        )
        ),
      )
    );

    // Verify that our counter starts at 0.
    /*expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);*/
  });
}
