import 'package:flutter/material.dart';
import 'package:islamic/core/constant/quran_helper.dart';
import 'package:islamic/core/models/sura_models.dart';
import 'package:islamic/core/routes/app_routes_name.dart';
import 'package:islamic/core/themes/app_colors.dart';
import 'package:islamic/modules/layout/pages/quran_details.dart';
import 'package:islamic/widgets/quran_card.dart';

class Quran extends StatelessWidget {
  const Quran({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/taj-mahal-agra-india 1 (1).png'),fit: BoxFit.cover)
      ),
child: Container(
  width: double.infinity,
  decoration:BoxDecoration(
    gradient: LinearGradient(colors: [
      Color(0xff202020).withOpacity(0.7),
      Color(0xff202020),
    ],
        end: Alignment.bottomCenter
    )
  ) ,
  child: SafeArea(
    child: Column(
      children: [
        Image.asset('assets/images/splach_images/Group 30.png'),
        Expanded(
          child: ListView.separated(
            itemCount: QuranHelper.suraNameAr.length,
            itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: QuranCard(suraModels: SuraModels(suraNameAr: QuranHelper.suraNameAr[index], suraNameEn: QuranHelper.suraNameEn[index], verses: QuranHelper.verses[index], index: index+1),),
            );

          }, separatorBuilder: (BuildContext context, int index) {
            return  Divider(
              endIndent: 40,
              indent: 40,
            );
          },),
        )

      ],
    ),
  ),
),
    );
  }
}
