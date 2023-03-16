import 'package:flutter/material.dart';

class TableSegments extends StatelessWidget {
  const TableSegments({super.key});

  @override
  Widget build(BuildContext context) {
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
        Column(
          children: const <Widget>[
            SegmentPositions(),
            SegmentPositions(),
            SegmentPositions(),
            SegmentPositions(),
            SegmentPositions(),
          ]
        )
      ],
    );
  }
}

class SegmentPositions extends StatelessWidget {
  const SegmentPositions({super.key});

  @override
  Widget build(BuildContext context) {
    final segm = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('Segment 1', style: TextStyle(color: Colors.white, fontSize: 20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const <Widget>[
            Text('User 1', style: TextStyle(color: Colors.white, fontSize: 20)),
            Text('Avg Time 1', style: TextStyle(color: Colors.white, fontSize: 20)),
            Text('Best Time 1', style: TextStyle(color: Colors.white, fontSize: 20)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const <Widget>[
            Text('User 1', style: TextStyle(color: Colors.white, fontSize: 20)),
            Text('Avg Time 1', style: TextStyle(color: Colors.white, fontSize: 20)),
            Text('Best Time 1', style: TextStyle(color: Colors.white, fontSize: 20)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const <Widget>[
            Text('User 1', style: TextStyle(color: Colors.white, fontSize: 20)),
            Text('Avg Time 1', style: TextStyle(color: Colors.white, fontSize: 20)),
            Text('Best Time 1', style: TextStyle(color: Colors.white, fontSize: 20)),
          ],
        ),
      ],
    );
    return segm;
  }
}