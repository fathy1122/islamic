import 'package:flutter/material.dart';
import 'package:islamic/core/routes/app_routes.dart';
import 'package:islamic/core/routes/app_routes_name.dart';
import 'package:islamic/modules/layout/pages/quran.dart';
import 'package:islamic/modules/splach_screen/splach_screen.dart';

import 'modules/onboarding/screen-1.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islamic',
debugShowCheckedModeBanner: false,
routes:AppRoutes.routes ,
      initialRoute: AppRoutesName.layout,
      home:Quran(),
    );
  }
}


