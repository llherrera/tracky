import 'package:flutter/material.dart';

class ListSegment extends StatefulWidget {
  const ListSegment({required Key key}) : super(key: key);

  @override
  State<ListSegment> createState() => _ListSegmentState();
}

class _ListSegmentState extends State<ListSegment> {
  String segmented = '';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Segment A',
              prefixIcon: Icon(Icons.route),
              contentPadding: EdgeInsets.symmetric(horizontal: 50.0),
            ),
            initialValue: segmented,
            onChanged: (value) {
              setState(() {
                segmented = value;
              });
            },
          ),
          const SizedBox(height: 10, width: 30),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Import Segment',
              contentPadding: EdgeInsets.symmetric(horizontal: 80.0),
            ),
            initialValue: segmented,
            onChanged: (value) {
              setState(() {
                segmented = value;
              });
            },
          ),
          const SizedBox(height: 10, width: 30),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Import Segment',
              contentPadding: EdgeInsets.symmetric(horizontal: 80.0),
            ),
            initialValue: segmented,
            onChanged: (value) {
              setState(() {
                segmented = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
