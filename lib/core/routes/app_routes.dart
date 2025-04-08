import 'package:flutter/material.dart';
import 'package:islamic/core/routes/app_routes_name.dart';
import 'package:islamic/modules/layout/pages/quran_details.dart';
import 'package:islamic/modules/layout/screens/layout_screen.dart';
import 'package:islamic/modules/onboarding/screen-1.dart';

import '../../modules/splach_screen/splach_screen.dart';

class AppRoutes{
 static Map<String, Widget Function(BuildContext)> routes={
    AppRoutesName.splash:(_)=>SplashScreen(),
    AppRoutesName.layout:(_)=>LayoutScreen(),
    AppRoutesName.onboarding:(_)=>Screen(),
    AppRoutesName.quranDetails:(_)=>QuranDetails(),
  };
}