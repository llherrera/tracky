import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tracky/Data/activity.dart';
import 'package:tracky/Data/segment.dart';
import 'package:tracky/Widgets/leadboard_widgets/table_segments.dart';

void main() {
  group('Activity', () {
    test('La activida debe devolver la distancia', () {
      final activity = Activity(DateTime.now(),
          DateTime.now().add(const Duration(hours: 1)), true, 'leo', []);
      activity.addRoute();
      expect(activity.getDistance(), 0);
    });
    test('La activida debe devolver el tiempo', () {
      final activity = Activity(DateTime.now(),
          DateTime.now().add(const Duration(hours: 1)), true, 'leo', []);
      activity.addRoute();
      expect(activity.getDuration(), isNotNull);
    });
  });
  group('Segments', () {
    test('El segmento debe devolver todas las actividades', () {
      final se = Segment(
          Position(
              longitude: -122.4194,
              latitude: 37.7749,
              timestamp: DateTime.now(),
              accuracy: 1,
              altitude: 1,
              heading: 1,
              speed: 1,
              speedAccuracy: 1),
          Position(
              longitude: -122.4184,
              latitude: 37.7759,
              timestamp: DateTime.now(),
              accuracy: 1,
              altitude: 1,
              heading: 1,
              speed: 1,
              speedAccuracy: 1),
          [
            Position(
                longitude: -122.4191,
                latitude: 37.7753,
                timestamp: DateTime.now(),
                accuracy: 1,
                altitude: 1,
                heading: 1,
                speed: 1,
                speedAccuracy: 1),
            Position(
                longitude: -122.4187,
                latitude: 37.7757,
                timestamp: DateTime.now(),
                accuracy: 1,
                altitude: 1,
                heading: 1,
                speed: 1,
                speedAccuracy: 1),
            Position(
                longitude: -122.4184,
                latitude: 37.7759,
                timestamp: DateTime.now(),
                accuracy: 1,
                altitude: 1,
                heading: 1,
                speed: 1,
                speedAccuracy: 1)
          ]);
      final sp = SegmentPositions(s: se, i: 1,);
      expect(sp, 0);
    });
    test('La activida debe devolver el tiempo', () {
      final activity = Activity(DateTime.now(),
          DateTime.now().add(const Duration(hours: 1)), true, 'leo', []);
      activity.addRoute();
      expect(activity.getDuration(), isNotNull);
    });
  });
}
