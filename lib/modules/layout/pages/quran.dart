import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic/core/constant/quran_helper.dart';
import 'package:islamic/core/models/sura_models.dart';
import 'package:islamic/core/routes/app_routes_name.dart';
import 'package:islamic/core/themes/app_colors.dart';
import 'package:islamic/modules/layout/pages/quran_details.dart';
import 'package:islamic/widgets/most_recently.dart';
import 'package:islamic/widgets/quran_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:shared_preferences/shared_preferences.dart';

class Quran extends StatefulWidget {
  Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  List<SuraModels> mostRecently = [];
  List<String> mostRecentlyIds = [];
  List<SuraModels> suraData1=[];
  @override
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/taj-mahal-agra-india 1 (1).png'),
              fit: BoxFit.cover)),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xff202020).withOpacity(0.7),
          Color(0xff202020),
        ], end: Alignment.bottomCenter)),
        child: SafeArea(
          child: Column(
            children: [
              Image.asset('assets/images/splach_images/Group 30.png'),
            TextFormField(
onChanged: (value) {
  searchData(value);
},
              style: TextStyle(
                color: AppColors.white,
                fontSize: 18,
              ),

              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/images/images_svg/Vector (1).svg',color: AppColors.gold,),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: AppColors.gold,width: 1)
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: AppColors.gold,width: 1)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: AppColors.gold,width: 1)
                ),
            hintText:'Sura Name',
                label: Text('Search'),
                hintStyle: TextStyle(
                  color: AppColors.white

                ),
                labelStyle: TextStyle(
                    color: AppColors.white
                )
              ),

            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Most Recently',style: TextStyle(
                    fontSize: 24,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),),

                ],
              ),
            ),
            if(mostRecently.isNotEmpty)  SizedBox(
                  height: 150,
                  child: ListView.builder(
                    itemCount: mostRecently.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.gold,
                              borderRadius: BorderRadius.circular(16)),
                          child: MostRecently(
                            data: SuraModels(
                                suraNameAr: mostRecently[index].suraNameAr,
                                suraNameEn: mostRecently[index].suraNameEn,
                                verses: mostRecently[index].verses,
                                index: mostRecently[index].index),
                          ),
                        ),
                      );
                    },
                  )),
              (suraData1.isEmpty)?  Expanded(
                child: ListView.separated(
                  itemCount: QuranHelper.suraNameAr.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: QuranCard(
                        suraModels: SuraModels(
                          suraNameAr: QuranHelper.suraNameAr[index],
                          suraNameEn: QuranHelper.suraNameEn[index],
                          verses: QuranHelper.verses[index],
                          index: index + 1,
                        ),
                        onTap: saveData,
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      endIndent: 40,
                      indent: 40,
                    );
                  },
                ),
              ):Expanded(
                child: ListView.separated(
                  itemCount: suraData1.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: QuranCard(
                        suraModels: SuraModels(
                          suraNameAr: suraData1[index].suraNameAr,
                          suraNameEn: suraData1[index].suraNameEn,
                          verses: suraData1[index].verses,
                          index: suraData1[index].index,
                        ),
                        onTap: saveData,
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      endIndent: 40,
                      indent: 40,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void saveData(SuraModels data) {
    mostRecently.insert(0, data);
    mostRecently = mostRecently.toSet().toList();
    saveLocalData((data.index - 1).toString());
    setState(() {});
  }

  Future<void> saveLocalData(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    mostRecentlyIds.insert(0, id);
    await prefs.setStringList('key', mostRecentlyIds);
  }

  Future<void> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    mostRecentlyIds = await prefs.getStringList('key') ?? [];
    for (String id in mostRecentlyIds) {
      int index = int.parse(id);
      mostRecently.add(SuraModels(
        suraNameAr: QuranHelper.suraNameAr[index],
        suraNameEn: QuranHelper.suraNameEn[index],
        verses: QuranHelper.verses[index],
        index: index + 1,
      ));
      mostRecently=mostRecently.toSet().toList();
    }

    setState(() {});
  }
void searchData(String value){
     suraData1=[];
    QuranHelper.suraNameEn.where(
        (element){
          if(element.toLowerCase().contains(value.toLowerCase())){
            int index=QuranHelper.suraNameEn.indexOf(element);
            suraData1.add(
              SuraModels(
                suraNameAr: QuranHelper.suraNameAr[index],
                suraNameEn: QuranHelper.suraNameEn[index],
                verses: QuranHelper.verses[index],
                index: index + 1,
              ),
            );
          }
          return true;
        }
    ).toList();
     QuranHelper.suraNameAr.where(
             (element){
           if(element.contains(value)){
             int index=QuranHelper.suraNameAr.indexOf(element);
             suraData1.add(
               SuraModels(
                 suraNameAr: QuranHelper.suraNameAr[index],
                 suraNameEn: QuranHelper.suraNameEn[index],
                 verses: QuranHelper.verses[index],
                 index: index + 1,
               ),
             );
           }
           return true;
         }
     ).toList();
    setState(() {

    });
}
}
