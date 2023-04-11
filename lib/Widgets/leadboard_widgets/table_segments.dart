import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../Data/segment.dart';

class TableSegments extends StatelessWidget {
  const TableSegments({super.key});

  @override
  Widget build(BuildContext context) {
    var boxSegm = Hive.box<Segment>('segments');
    return Column(children: <Widget>[
      Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const <Widget>[
              Text('User',
                  style: TextStyle(color: Color(0xFFCCCCCC), fontSize: 20)),
              Text('Avg Time',
                  style: TextStyle(color: Color(0xFFCCCCCC), fontSize: 20)),
              Text('Best Time',
                  style: TextStyle(color: Color(0xFFCCCCCC), fontSize: 20)),
            ],
          )),
      ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          reverse: true,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: boxSegm.length,
          itemBuilder: (context, index) {
            return Container(
                child: SegmentPositions(s: boxSegm.get(index), i: index));
          })
    ]);
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
  @override
  Widget build(BuildContext context) {
    var boxSegm = Hive.box<Segment>('segments');
    var boxAct = Hive.box<Segment>('activitiess');
    var boxUser = Hive.box<Segment>('userss');
    /*for (int j = 0; j < boxAct.length; j++) {
      if () {

      }
    }
    var acts = boxSegm.getActivities();
    */final segm = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Segment ${widget.i}',
            style: TextStyle(color: Colors.white, fontSize: 20)),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            reverse: true,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: boxSegm.length,
            itemBuilder: (context, index) {
              //return Container(child: SegmentPositions(s: boxSegm.get(index)));
            }),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const <Widget>[
            Text('User 1', style: TextStyle(color: Colors.white, fontSize: 20)),
            Text('Avg Time 1',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            Text('Best Time 1',
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const <Widget>[
            Text('User 1', style: TextStyle(color: Colors.white, fontSize: 20)),
            Text('Avg Time 1',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            Text('Best Time 1',
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const <Widget>[
            Text('User 1', style: TextStyle(color: Colors.white, fontSize: 20)),
            Text('Avg Time 1',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            Text('Best Time 1',
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ],
        ),
      ],
    );
    return segm;
  }
}
