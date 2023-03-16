import 'package:flutter/material.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF1C5E85),
            Color(0xF05D8FAD),
          ]
        )
      ),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      onPressed: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                  child: Text(
                    'Cycling',
                    style: TextStyle(color: Color(0xFFADCEE1)),
                  ),
                ),
                Text(
                  'Best time: 40:00',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Text(
                  'Distance: 20 km',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Text(
                  'Date: March 8, 2022',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                  child: Text(
                    'Running',
                    style: TextStyle(color: Color(0xFFADCEE1)),
                  ),
                ),
                Text(
                  'Best time: 40:00',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Text(
                  'Distance: 20 km',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Text(
                  'Date: March 8, 2022',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}