import 'package:flutter/material.dart';

class PodiumPage extends StatelessWidget {
  PodiumPage({super.key});

  final List<Widget> _widgetOptions = <Widget>[
    Row(
      children: <Widget>[
        const Text('User', style: TextStyle(color: Colors.black, fontSize: 30)),
        const Text('Avg time', style: TextStyle(color: Colors.black, fontSize: 30)),
        const Text('Best time', style: TextStyle(color: Colors.black, fontSize: 30)),
      ]
    ),
    Row(
      children: <Widget>[
        const Text('User', style: TextStyle(color: Colors.black, fontSize: 30)),
        const Text('Avg time', style: TextStyle(color: Colors.black, fontSize: 30)),
        const Text('Best time', style: TextStyle(color: Colors.black, fontSize: 30)),
      ]
    ),
    Row(
      children: <Widget>[
        const Text('User', style: TextStyle(color: Colors.black, fontSize: 30)),
        const Text('Avg time', style: TextStyle(color: Colors.black, fontSize: 30)),
        const Text('Best time', style: TextStyle(color: Colors.black, fontSize: 30)),
      ]
    ),
  ];

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
              children: <Widget>[
                Row(
                  children: const <Widget>[
                    Text('Podium', style: TextStyle(color: Colors.white, fontSize: 30)),
                    Spacer(flex: 1),
                    Icon(Icons.leaderboard, color: Colors.white, size: 30),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          //padding: const EdgeInsets.symmetric(horizontal: 20)
                        ),
                        child: const Text('Running', style: TextStyle(color: Colors.black, fontSize: 20)),
                      )
                    ),
                    const Spacer(flex: 1),
                    Flexible(
                      child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          //padding: const EdgeInsets.symmetric(horizontal: 20)
                        ),
                        child: const Text('Cycling', style: TextStyle(color: Colors.black, fontSize: 20)),
                      )
                    ),
                  ],
                ),
                /*ListView.separated(
                  padding: const EdgeInsets.only(top:100),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      color: Colors.white,
                      child: Center(
                        child: Text('Entry ${_widgetOptions[index]}'),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                  itemCount: _widgetOptions.length
                )*/
              ],
            ),
          ),
        ]
      ),
    );
  }
}