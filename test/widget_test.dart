
import 'package:flutter_test/flutter_test.dart';
import 'package:tracky/Data/activity.dart';

void main() {
  group('Activity', () {
    test('La activida debe devolver la distancia', () {
      final activity = Activity(DateTime.now(), DateTime.now().add(const Duration(hours: 1)), true, 'leo',[]);
      activity.addRoute();
      expect(activity.getDistance(), 0);
    });
    test('La activida debe devolver el tiempo', () {
      final activity = Activity(DateTime.now(), DateTime.now().add(const Duration(hours: 1)), true, 'leo',[]);
      activity.addRoute();
      expect(activity.getDuration(), isNotNull);
    });
  });
}
