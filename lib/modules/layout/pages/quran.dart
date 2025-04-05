import 'package:flutter/material.dart';

class Quran extends StatelessWidget {
  const Quran({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/taj-mahal-agra-india 1 (1).png'),fit: BoxFit.cover)
      ),
child: Container(
  decoration:BoxDecoration(
    gradient: LinearGradient(colors: [
      Color(0xff202020).withOpacity(0.7),
      Color(0xff202020),
    ],
        end: Alignment.bottomCenter
    )
  ) ,
),
    );
  }
}
