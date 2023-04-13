import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:tracky/Data/activity.dart';
import 'package:tracky/Data/user_model.dart';
import 'package:collection/collection.dart';
import '../../Data/segment.dart';

class TableSegments extends StatelessWidget {
  const TableSegments({super.key});

  @override
  Widget build(BuildContext context) {
    var boxSegm = Hive.box<Segment>('segments');
    if (boxSegm.isNotEmpty) {
      return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const <Widget>[
              Text('User', style: TextStyle(color: Color(0xFFCCCCCC), fontSize: 20)),
              Text('Avg Time', style: TextStyle(color: Color(0xFFCCCCCC), fontSize: 20)),
              Text('Best Time', style: TextStyle(color: Color(0xFFCCCCCC), fontSize: 20)),
            ],
          )
        ),
        ListView.builder(//construye cada segmento
          physics: const NeverScrollableScrollPhysics(),
          //reverse: true,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: boxSegm.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Text('Segment $index', style: const TextStyle(color: Colors.white, fontSize: 20)),
                SegmentPositions(s: boxSegm.getAt(index) ,i: index)
              ]
            );
          }
        )
      ]
    );} else {
      return const Center(
        child: Text(
          'No segments added',
          style: TextStyle(color: Colors.white, fontSize: 20),
        )
      );
    }
  }
}

// ignore: must_be_immutable
class SegmentPositions extends StatefulWidget {
  SegmentPositions({super.key, required this.s, required this.i});
  Segment? s;
  int i;
  @override
  State<SegmentPositions> createState() => _SegmentPositionsState();
}

class _SegmentPositionsState extends State<SegmentPositions> {
  var boxActs = Hive.box<Activity>('activitiess');
  var boxUser = Hive.box<UserM>('userss');

  List<Activity> getActivities(Segment segment) {
    List<Activity> acts = [];
    for (var act in boxActs.values) {
      int temp = 0;
      for (int j = 0; j < act.routeList.length; j++) {
        for (int k = 0; k < segment.routeList.length; k++) {
          double dist = Geolocator.distanceBetween(act.routeList[j].latitude, act.routeList[j].longitude, segment.routeList[k].latitude, segment.routeList[k].longitude);
          if (dist < 2) {
            temp+=1;
          }
        }
      }
      if (temp == segment.routeList.length) {
        acts.add(act);
      }
    }
    return acts;
  }

  @override
  Widget build(BuildContext context) {
    List<Activity> acts = getActivities(widget.s!);
    Map<String, List<Activity>> groupAct = groupBy<Activity, String>(acts, (a) => a.userName);
    //print(groupAct[groupAct.keys.elementAt(0)]);
    //final Iterable<dynamic> users = acts.where((element) => element.userName == user?.name);
    final segm = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListView.builder(//construye cada usuario, saca el avg y el best de cada usuario
          physics: const NeverScrollableScrollPhysics(),
          reverse: true,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: groupAct.length,
          itemBuilder: (context, index) {
            Iterable<Duration> times = groupAct[groupAct.keys.elementAt(index)]!.map((e) => e.getDuration());
            double avg = times.map((time) => time.inMinutes).reduce((a, b) => a+b)/times.length;
            Duration min = times.reduce((a, b) => a.compareTo(b) < 0 ? a : b);
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(groupAct.keys.elementAt(index), style: const TextStyle(color: Colors.white, fontSize: 20)),
                Text(avg.toString(), style: const TextStyle(color: Colors.white, fontSize: 20)),
                Text(min.toString(), style: const TextStyle(color: Colors.white, fontSize: 20)),
              ],
            );
          }
        ),
      ],
    );
    return segm;
  }
}