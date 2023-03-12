import 'package:flutter/material.dart';
import '../../UI/activity_page.dart';

class AddActivityButton extends StatelessWidget {
  const AddActivityButton({super.key});

  @override
  Widget build(BuildContext context) {
    final addActBtn = OutlinedButton(
      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const AddActivity()));},
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(50),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const <Widget>[
            Text(
              'Add Activity',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold
              )
            ),
            Icon(Icons.add, color: Colors.white, size: 60,),
          ],
        ),
      )
    );
    final btnGradient = Container(
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF1C5E85),
            Color(0xF05D8FAD),
          ]
        )
      ),
      child: addActBtn
    );
    return btnGradient;
  }
}