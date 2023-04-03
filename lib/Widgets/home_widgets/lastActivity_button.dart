import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tracky/Data/activity.dart';
import 'package:tracky/Data/user.dart';
import 'package:tracky/UI/activity_detail.dart';

class LastActivityBtn extends StatefulWidget {
  LastActivityBtn({super.key, required this.act});
  Activity? act;

  @override
  State<LastActivityBtn> createState() => _LastActivityBtnState();
}

class _LastActivityBtnState extends State<LastActivityBtn> {
  @override
  Widget build(BuildContext context) {
    //final UserProvider userP = Provider.of<UserProvider>(context, listen: false);
    //final User? user = userP.user;
    Activity act = widget.act!;
    final date = act.dateStart;


    final btn = OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      onPressed: () {
         Get.to(() => const Activitydetail());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(padding: const EdgeInsets.only(top: 10, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('${date.day}/ ${date.month}, ${date.hour}:${date.minute}',
                    style: const TextStyle(color: Colors.white, fontSize: 10),),
                  const Icon(Icons.settings, color: Colors.white, size: 20,),
                ],
              )
            ),
            Padding(padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Text('Route ${act.getId}: ${act.getDistance()} km', style: const TextStyle(color: Colors.white),)
            ),
            Padding(padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: Text(act.type! ? 'Running' : 'Cycling',
                style: const TextStyle(color: Color(0xFFADCEE1)),),
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