import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/core/models/sura_models.dart';
import 'package:islamic/core/themes/app_colors.dart';

class QuranDetails extends StatefulWidget {

  QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    SuraModels suraModels =
        ModalRoute.of(context)!.settings.arguments as SuraModels;


    if(verses.isEmpty){
      readFile(suraModels.index.toString());
    }
    return Scaffold(

      backgroundColor: AppColors.bg,

      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: Text(
          suraModels.suraNameEn,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: AppColors.gold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: AppColors.gold,
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/Mask group (1).png'),
                  Center(
                    child: Text(
                      suraModels.suraNameAr,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: AppColors.gold,
                      ),
                    ),
                  ),
                  Image.asset('assets/images/Mask group.png'),
                ],
              ),

            ),
Expanded(
  child:verses.isEmpty?Center(child: CircularProgressIndicator()): Padding(
    padding: const EdgeInsets.only(right: 20.0),
    child: SingleChildScrollView(
      child: Text.rich(TextSpan(

        children: verses.map((e) {
          int index=verses.indexOf(e);
          return TextSpan(
            text: '$e [${index+1}] ',style: TextStyle(
              color:e.contains('اللَّهِ')?Colors.brown: AppColors.gold,
              fontSize: 24,

            ),
          recognizer:TapGestureRecognizer()..onTap=(){
              showModalBottomSheet(context: context, builder: (context) {
                return Container(

                  decoration: BoxDecoration(
                    color: AppColors.bg,

                  ),
                  width: double.infinity,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textDirection: TextDirection.rtl,
                        children: [
                          Text(e,style: TextStyle(
                            fontSize: 24,
                            color: AppColors.gold,
                          ),)
                        ],
                      ),
                    ),
                  ),
                );
              },);
          }
          );

        },).toList()
      ),
        textDirection:TextDirection.rtl,
      ),
    ),
  ),
)
            // Image.asset('assets/images/Mask group (2).png'),
          ],
        ),
      ),
    );
  }

  void readFile(String id) async {
    String data = await rootBundle.loadString('assets/Suras/${id}.txt');
   data= data.trim();
verses=data.split('\n');
setState(() {

});
    print(data);
  }
}
