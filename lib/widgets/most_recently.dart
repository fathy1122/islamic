import 'package:flutter/material.dart';
import 'package:islamic/core/models/sura_models.dart';
import 'package:islamic/core/routes/app_routes_name.dart';

import '../core/themes/app_colors.dart';

class MostRecently extends StatelessWidget {
 final SuraModels data;
  const MostRecently({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutesName.quranDetails,arguments: data);
      },
      child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(data.suraNameEn,style: TextStyle(
      fontSize: 24,
      color: AppColors.black,
      ),),
      Text(data.suraNameAr,style: TextStyle(
      fontSize: 24,
      color: AppColors.black,
      ),),
      Text('${data.verses} verses',style: TextStyle(
      fontSize: 14,
      color: AppColors.black,
      ),),

      ],
      ),
      Column(
      children: [
      Image.asset('assets/images/Rectangle 124.png',width:125,),
      ],
      )
      ],
      ),
      ),
    );
  }
}
