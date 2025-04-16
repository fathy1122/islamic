import 'package:flutter/material.dart';
import 'package:islamic/core/themes/app_colors.dart';

class Sebha extends StatefulWidget {
  @override
  _SebhaState createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  int _pressCount = 0;
  static int count=0;
  double _rotationAngle = 0.0;
  final int _totalPressesForFullRotation = 33;
List<String> tsbeh=[
  'سبحان الله ',
  'الحمد لله',
  ' الله اكبر ',
];
  void _handleButtonPress() {
    setState(() {
      if(_pressCount==33){
        _pressCount=0;
        count++;
      }
      if(count==3){
        count=0;
      }
      _pressCount++;
      // احسب الزاوية بناءً على عدد الضغطات
      _rotationAngle = (_pressCount % _totalPressesForFullRotation) *
          (360.0 / _totalPressesForFullRotation);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/Background (1).png',),fit:BoxFit.cover )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
        Image.asset('assets/images/Group 31.png',width: 250,),
            Spacer(),
            Text('سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
            style: TextStyle(
              fontSize: 30,
              color: AppColors.white,
            ),),
            Spacer(),
            Stack(
              alignment: Alignment.center,
              children: [
                // الصورة الثابتة في المركز
                InkWell(
                  onTap:  _handleButtonPress,
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,

                      image: DecorationImage(
                        image:AssetImage('assets/images/SebhaBody 1 (1).png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(tsbeh[count] , style: TextStyle(fontSize: 30,
                          color: AppColors.white,
                              fontWeight: FontWeight.bold
                      ),),
                          Text(
                            ' $_pressCount' ,
                            style: TextStyle(fontSize: 30,
                                color: AppColors.white,
                              fontWeight: FontWeight.bold

                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // الصورة الدوارة
                Transform.rotate(
                  angle: _rotationAngle * (3.14159265359 / 180), // تحويل الزاوية إلى راديان
                  child: Transform.translate(
                    offset: Offset(0, -150), // المسافة من المركز
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/Group 37.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

      SizedBox(height: 75,)


          ],
        ),
      ),
    );
  }
}
