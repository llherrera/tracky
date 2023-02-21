import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 20, left: 15),
            child: OutlinedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              }, 
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20)
              ),
              icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.white),
              label: const Text(''),
            )
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: const <Widget>[
                Text('Activity History', style: TextStyle(color: Colors.white, fontSize: 30)),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.white),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide.none
                    ),
                    prefixIcon: Icon(Icons.search, color: Colors.white)
                  ),
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}