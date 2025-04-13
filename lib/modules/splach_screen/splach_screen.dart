import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islamic/core/routes/app_routes_name.dart';
import 'package:islamic/core/themes/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
  Future.delayed(Duration(seconds: 5),(){
    Navigator.pushNamedAndRemoveUntil(context, AppRoutesName.onboarding,(route) => false,);
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[

        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/splach_images/Rectangle 1 (1).png'),fit: BoxFit.cover),
          ),

          child: Scaffold(
            backgroundColor: Colors.transparent,
            body:Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Stack(

                children: [


                  Positioned(
                      right: 10,
                      child: FadeInDown(
                        delay: Duration(seconds: 2),
                          duration: Duration(seconds: 1),
                          child: Image(image: AssetImage('assets/images/splach_images/Glow.png'),width: 70,))),
                  Positioned(
                      left: 0,
                      top: 100,
                      child: FadeInLeft(
                        delay: Duration(seconds: 3),
                          duration: Duration(seconds: 1),
                          child: Image(image: AssetImage('assets/images/splach_images/Shape-07 1.png'),width: 70,))),
                  Positioned(
                      right: 2,
                      bottom: 100,
                      child: FadeInRight(delay: Duration(seconds: 3),
                          duration: Duration(seconds: 1),
                          child: Image(image: AssetImage('assets/images/splach_images/Shape-04 1.png'),width: 70,))),
                  ZoomIn(delay: Duration(seconds: 1),
                      duration: Duration(seconds: 1),
                      child: Center(child: Image(image: AssetImage('assets/images/splach_images/Group 36 (1).png'),width: 150,))),

                  Positioned(
                    left: MediaQuery.of(context).size.width*0.30,
                    bottom: 25,
              child: FadeInUp(delay: Duration(seconds: 4),
                  duration: Duration(seconds: 1),
                  child: Image(image: AssetImage('assets/images/splach_images/Group 29.png'),width: 150,)),),
            //
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 50,
          child: Container(

            width: 250,
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/splach_images/Mosque-01 1.png',))
            ),
          ),
        ),
      ]
    );
  }
}
