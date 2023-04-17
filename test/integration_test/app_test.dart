
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import '../integration_test/driver.dart';

void main() {
  group(
    'Integration Tests',
    () {
      FlutterDriver? driver;

      setUpAll(() async {
        // Wait for 5 seconds to ensure that the application is fully launched.
        await Future.delayed(Duration(seconds: 5));

        driver = await FlutterDriver.connect();
      });

      tearDownAll(() async {
        if (driver != null) {
          await driver!.close();
        }
      });

      test('Login con usuario no creado', () async {
        final usernameField = find.byValueKey('usernameField');
        final passwordField = find.byValueKey('passwordField');
        final loginButton = find.byValueKey('loginButton');

        await driver!.tap(usernameField);
        await driver!.enterText('nonexistentUser');
        await driver!.tap(passwordField);
        await driver!.enterText('nonexistentPassword');
        await driver!.tap(loginButton);

        final errorMessage = find.text('User not found');
        expect(await driver!.getText(errorMessage), 'User not found');
      });

      test('Crear un nuevo usuario', () async {
        final signUpButton = find.byValueKey('signUpButton');

        await driver!.tap(signUpButton);

        final registerUsernameField = find.byValueKey('registerUsernameField');
        final registerEmailField = find.byValueKey('registerEmailField');
        final registerPasswordField = find.byValueKey('registerPasswordField');
        final registerSubmitButton = find.byValueKey('registerSubmitButton');

        await driver!.tap(registerUsernameField);
        await driver!.enterText('testUser');
        await driver!.tap(registerEmailField);
        await driver!.enterText('test@example.com');
        await driver!.tap(registerPasswordField);
        await driver!.enterText('testPassword');
        await driver!.tap(registerSubmitButton);
      });

      test('Login con nuevo usuario', () async {
        final usernameField = find.byValueKey('usernameField');
        final passwordField = find.byValueKey('passwordField');
        final loginButton = find.byValueKey('loginButton');

        await driver!.tap(usernameField);
        await driver!.enterText('testUser');
        await driver!.tap(passwordField);
        await driver!.enterText('testPassword');
        await driver!.tap(loginButton);

        final homePage = find.text('Welcome to the Home Page');
        expect(await driver!.getText(homePage), 'Welcome to the Home Page');
      });

      test('Revisar historial de actividades (hard coded)', () async {
        final historyButton = find.byValueKey('historyButton');

        await driver!.tap(historyButton);

        final activityTitle = find.text('Activity 1');
        expect(await driver!.getText(activityTitle), 'Activity 1');
      });

      test('Revisar detalles de actividad', () async {
        final activityDetailsButton = find.byValueKey('activityDetailsButton');

        await driver!.tap(activityDetailsButton);

        test('Ver detalles de actividad', () async {
          final activityDetailsButton =
              find.byValueKey('activityDetailsButton');

          await driver!.tap(activityDetailsButton);

          final activityTitle = find.text('Activity Title');
          final activityDescription = find.text('Activity Description');
          final activityDate = find.text('Activity Date');

          expect(await driver!.getText(activityTitle), 'Activity Title');
          expect(await driver!.getText(activityDescription),
              'Activity Description');
          expect(await driver!.getText(activityDate), 'Activity Date');
        });

        test('Ver historial de actividades', () async {
          final historyButton = find.byValueKey('historyButton');

          await driver!.tap(historyButton);

          final activity1 = find.text('Activity 1');
          final activity2 = find.text('Activity 2');
          final activity3 = find.text('Activity 3');

          expect(await driver!.getText(activity1), 'Activity 1');
          expect(await driver!.getText(activity2), 'Activity 2');
          expect(await driver!.getText(activity3), 'Activity 3');
        });

        test('Creacion de nueva actividad o segmento multiples usuarios',
            () async {
          final newActivityButton = find.byValueKey('newActivityButton');

          await driver!.tap(newActivityButton);

          final activityTitleField = find.byValueKey('activityTitleField');
          final activityDescriptionField =
              find.byValueKey('activityDescriptionField');
          final activityDateField = find.byValueKey('activityDateField');
          final createActivityButton = find.byValueKey('createActivityButton');

          await driver!.tap(activityTitleField);
          await driver!.enterText('New Activity 1');
          await driver!.tap(activityDescriptionField);
          await driver!.enterText('This is a description of the new activity');
          await driver!.tap(activityDateField);
          await driver!.enterText('2022-01-01');
          await driver!.tap(createActivityButton);

          final newActivity = find.text('New Activity 1');
          expect(await driver!.getText(newActivity), 'New Activity 1');
        });
      });
    },
  );
}

//flutter drive --driver test/integration_test/driver.dart --target test/integration_test/app_test.dart --no-sound-null-safety


