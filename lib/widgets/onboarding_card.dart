import 'package:flutter/material.dart';
import 'package:islamic/core/routes/app_routes.dart';
import 'package:islamic/core/routes/app_routes_name.dart';
import 'package:islamic/core/themes/app_colors.dart';

import '../core/routes/app_routes_name.dart';

class OnboardingCard extends StatelessWidget {
 final String image,title,description,buttonText;
   OnboardingCard({super.key,required this.image, required this.title, required this.description, required this.buttonText, required this.onPressed});
   final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
color: AppColors.black,
      width: MediaQuery.of(context).size.width ,
      height: MediaQuery.of(context).size.height,

child: Column(
  mainAxisSize: MainAxisSize.max,
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Stack(children:[
      Image(image: AssetImage('assets/images/splach_images/Group 30.png'),width: 220,),

] ),
    Padding(
      padding: const EdgeInsets.all(30.0),
      child: Image(image: AssetImage('$image'),width: 200,fit: BoxFit.contain,),
    ),
    Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title,textAlign: TextAlign.center,style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w900,
            color: AppColors.gold,
          ),),
        ),
        Text(description,textAlign: TextAlign.center,style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w900,
          color: AppColors.gold,
        ),),
      ],
    ),
    MaterialButton(


    onPressed:()=>onPressed(),

      child: Text(buttonText,style: TextStyle(
        color: AppColors.gold,
      ),),
    ),
    ElevatedButton(onPressed: (){
      Navigator.pushNamedAndRemoveUntil(context, AppRoutesName.layout,(route) => false,);
    }, child: Text('Skip')),
  ],
  
),
    );
  }
}
