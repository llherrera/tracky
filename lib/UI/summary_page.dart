import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

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
                //padding: const EdgeInsets.symmetric(horizontal: 20)
              ),
              icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.white),
              label: const Text(''),
            )
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: const <Widget>[
                    Text('Summary', style: TextStyle(color: Colors.white, fontSize: 30)),
                    Spacer(flex: 1),
                    Icon(Icons.directions_run, color: Colors.white, size: 30),
                  ],
                ),
                const Text('Running', style: TextStyle(color: Colors.white, fontSize: 30)),
                /*
                maps
                */
                const Text('KM', style: TextStyle(color: Colors.white, fontSize: 30)),
                const Text('Time', style: TextStyle(color: Colors.white, fontSize: 30)),
                Row(
                  children: <Widget>[
                    Flexible(child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        //padding: const EdgeInsets.symmetric(horizontal: 20)
                      ),
                      child: const Text('Save', style: TextStyle(color: Colors.black, fontSize: 20)),
                    )),
                    const Spacer(flex: 1),
                    Flexible(child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        //padding: const EdgeInsets.symmetric(horizontal: 20)
                      ),
                      child: const Text('Delete', style: TextStyle(color: Colors.black, fontSize: 20)),
                    )),
                  ],
                ),
              ],
            ),
          ),
        ]
      )
    );
  }
}