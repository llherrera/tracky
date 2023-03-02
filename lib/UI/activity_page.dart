import 'package:flutter/material.dart';
import 'summary_page.dart';

class AddActivity extends StatelessWidget {
  const AddActivity({super.key});

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
            margin: const EdgeInsets.only(right: 20),
            child: Column(
              children: <Widget>[
                const Text('Activity', style: TextStyle(color: Colors.white, fontSize: 30)),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: ElevatedButton.icon(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          //padding: const EdgeInsets.symmetric(horizontal: 20)
                        ),
                        icon: const Icon(Icons.directions_run, color: Colors.black),
                        label: const Text('Sprint', style: TextStyle(color: Colors.black))
                      ),
                    ),
                    const Spacer(flex: 1),
                    Flexible(
                      flex: 1,
                      child: ElevatedButton.icon(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          //padding: const EdgeInsets.symmetric(horizontal: 20)
                        ),
                        icon: const Icon(Icons.directions_bike, color: Colors.black),
                        label: const Text('Cycling', style: TextStyle(color: Colors.black))
                      ),
                    ),
                  ],
                ),
                /*
                maps
                */
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const SummaryPage()));},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      //padding: const EdgeInsets.symmetric(horizontal: 20)
                    ),
                    icon: const Icon(Icons.play_arrow, color: Colors.black),
                    label: const Text('Start', style: TextStyle(color: Colors.black))
                  ),
                )
              ],
              /*children: <Widget>[
                const Text('Activity', style: TextStyle(color: Colors.white, fontSize: 30)),
                const Spacer(flex: 1),
                
              ],*/
            ),
          )
        ]
      ),
    );
  }
}
