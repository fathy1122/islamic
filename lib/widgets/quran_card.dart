import 'package:flutter/material.dart';
import 'package:islamic/core/models/sura_models.dart';

import '../core/routes/app_routes_name.dart';
import '../core/themes/app_colors.dart';

class QuranCard extends StatelessWidget {
  final SuraModels suraModels;
   QuranCard({super.key,required this.suraModels});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutesName.quranDetails,arguments: suraModels);
      },
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/arabic-art-svgrepo-com 1.png')),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text((suraModels.index).toString(),style: TextStyle(
                    fontSize: 12,
                    color: AppColors.white
                ),),
              ),
            ),
          ),
          Column(
            children: [
              Text(suraModels.suraNameEn,style: TextStyle(
                fontSize: 20,
                color: AppColors.white,
              ),),
              Center(
                child: Text('Verses ${suraModels.verses}',style: TextStyle(
                  fontSize: 16,
                  color: AppColors.white,
                ),),
              )
            ],
          ),
          Spacer(),
          Column(
            children: [
              Text(suraModels.suraNameAr,style: TextStyle(
                fontSize: 30,
                color: AppColors.white,

              ),),
              Center(
                child: Text('عدد الايات ${suraModels.verses}',style: TextStyle(
                  fontSize: 18,
                  color: AppColors.white,

                ),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
