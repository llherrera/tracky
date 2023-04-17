import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tracky/Data/activity.dart';
import 'package:flutter/material.dart';
import 'package:tracky/Data/user.dart';
import 'package:tracky/UI/activity_page.dart';
import 'package:tracky/Widgets/home_widgets/lastActivity_button.dart';
import 'package:tracky/UI/activity_detail.dart';
import 'package:tracky/Widgets/segments_widget/list_segment.dart';

void main() {
  group('Widget Test para actidad', () {
    testWidgets('1) Crear Actividad', (WidgetTester tester) async {});
    testWidgets(
        '2) Listar todas las actividades', (WidgetTester tester) async {});
    testWidgets('3) Ver detalles actividad', (WidgetTester tester) async {
      Activity activity = Activity(DateTime.now(),
          DateTime.now().add(const Duration(minutes: 5)), true, 'leonardo', [Position(longitude: -122.4194, latitude: 37.7749, timestamp: DateTime.now(), accuracy: 1, altitude: 1, heading: 1, speed: 1, speedAccuracy: 1), Position(longitude: -122.4194, latitude: 37.7749, timestamp: DateTime.now(), accuracy: 1, altitude: 1, heading: 1, speed: 1, speedAccuracy: 1), Position(longitude: -122.4194, latitude: 37.7749, timestamp: DateTime.now(), accuracy: 1, altitude: 1, heading: 1, speed: 1, speedAccuracy: 1)]);
      await tester
          .pumpWidget(GetMaterialApp(home: Activitydetail(act: activity)));
      expect(find.text('Activity details'), findsOneWidget);
    });
    testWidgets(
        '4) Crear actividad multisusuarios', (WidgetTester tester) async {});
    testWidgets('5) Guardar actividad', (WidgetTester tester) async {});
  });
}
