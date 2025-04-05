import 'dart:collection';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic/core/themes/app_colors.dart';
import 'package:islamic/modules/layout/pages/hadeth_screen.dart';
import 'package:islamic/modules/layout/pages/quran.dart';
import 'package:islamic/modules/layout/pages/radio.dart';
import 'package:islamic/modules/layout/pages/sebha.dart';

import '../pages/time.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedIndex=0;

  List<Widget> screens=[
    Quran(),HadethScreen(),Sebha(),Radi(),Time(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: screens[selectedIndex],
    bottomNavigationBar:BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (value) {
selectedIndex=value;
setState(() {

});
      },
      backgroundColor: AppColors.gold,
        type: BottomNavigationBarType.fixed,
        fixedColor: AppColors.white,
        // unselectedItemColor: AppColors.black,
        showUnselectedLabels: false,
        items: [
     _customButtonItem(image: 'assets/images/images_svg/Vector (1).svg',label: 'Quran'),
     _customButtonItem(image: 'assets/images/images_svg/book-album-svgrepo-com 1 (7).svg',label: 'Hadith'),
     _customButtonItem(image: 'assets/images/images_svg/necklace-islam-svgrepo-com 1.svg',label: 'Sebha'),
     _customButtonItem(image: 'assets/images/images_svg/radio-svgrepo-com 1.svg',label: 'Radio'),
     _customButtonItem(image: 'assets/images/images_svg/Vector (8).svg',label: 'Time'),


      // BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/images_svg/necklace-islam-svgrepo-com 1.svg'),label: 'Home'),
      // BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/images_svg/radio-svgrepo-com 1.svg'),label: 'Home'),
      // BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/images_svg/Vector (8).svg'),label: 'Home'),
    ]),
    );
  }

  BottomNavigationBarItem _customButtonItem({required String image, required String label}){
return   BottomNavigationBarItem(icon:SvgPicture.asset(image,color: AppColors.black,width: 30,height: 30,),label: label,
    activeIcon: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.black.withOpacity(0.6),
        ),
        child: BounceIn(child: SvgPicture.asset(image,color: AppColors.white,)))
);
  }
}
