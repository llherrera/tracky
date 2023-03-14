import 'package:flutter/material.dart';

class ListSegment extends StatefulWidget {
  const ListSegment({super.key});

  @override
  State<ListSegment> createState() => _ListSegmentState();
}

class _ListSegmentState extends State<ListSegment> {
  String segmentfield = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TextFormField(
          decoration: const InputDecoration(labelText: 'Segment A'),
          initialValue: segmentfield,
          onChanged: (value) {
            setState(() {
              segmentfield = value;
            });
          },
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Import Segment'),
          initialValue: segmentfield,
          onChanged: (value) {
            setState(() {
              segmentfield = value;
            });
          },
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Import Segment'),
          initialValue: segmentfield,
          onChanged: (value) {
            setState(() {
              segmentfield = value;
            });
          },
        ),
      ],
    );
  }
}
