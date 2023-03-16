import 'package:flutter/material.dart';

class LastActivityBtn extends StatelessWidget {
  const LastActivityBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final btn = OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      onPressed: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(padding: const EdgeInsets.only(top: 10, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text('10 May, 12:30 pm', style: TextStyle(color: Colors.white, fontSize: 10),),
                  Icon(Icons.settings, color: Colors.white, size: 20,),
                ],
              )
            ),
            const Padding(padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Text('Route 20: 40 km', style: TextStyle(color: Colors.white),)
            ),
            const Padding(padding: EdgeInsets.only(top: 5, bottom: 10),
              child: Text('Cycling', style: TextStyle(color: Color(0xFFADCEE1)),),
            )
          ],
        ),
      ),
    );

    final gradientBtn = Container(
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
      child: btn
    );
    
    return gradientBtn;
  }
}