import 'package:flutter/material.dart';
import 'package:islamic/core/routes/app_routes_name.dart';
import 'package:islamic/core/themes/app_colors.dart';
import 'package:islamic/widgets/onboarding_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  static final PageController _pageController = PageController(initialPage: 0);
  List<Widget> _onBoardingPages = [

    OnboardingCard(image: 'assets/images/Frame 3.png',title: 'Welcome p1',buttonText: 'Next',description: 'Welcome To Islmi App',onPressed: (){
      _pageController.animateToPage(1, duration: Durations.long1, curve: Curves.linear);
    },),
    OnboardingCard(image: 'assets/images/Frame 3 (1).png',title: 'Welcome To Islami',buttonText: 'Next',description: 'We Are Very Excited To Have You In Our Community',onPressed: (){

      _pageController.animateToPage(2, duration: Durations.long1, curve: Curves.linear);
    }),
    OnboardingCard(image: 'assets/images/Frame 3 (2).png',title: 'Reading the Quran',buttonText: 'Next',description: 'Read, and your Lord is the Most Generous',onPressed: (){
      _pageController.animateToPage(3, duration: Durations.long1, curve: Curves.linear);
    }),
    OnboardingCard(image: 'assets/images/Frame 3 (3).png',title: 'Bearish',buttonText: 'Next',description: 'Praise the name of your Lord, the Most High',onPressed: (){
      _pageController.animateToPage(4, duration: Durations.long1, curve: Curves.linear);
    }),
    OnboardingCard(image: 'assets/images/Frame 3 (4).png',title: 'Holy Quran Radio',buttonText: 'Finnish',description: 'You can listen to the Holy Quran Radio through the application for free and easily',onPressed: (){
      _pageController.animateToPage(5, duration: Durations.long1, curve: Curves.linear);
    }),

  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 50,
      ),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: PageView(
              controller: _pageController,
              children: _onBoardingPages,

            )),
            SmoothPageIndicator( controller: _pageController, count: _onBoardingPages.length,effect:ExpandingDotsEffect(

              activeDotColor: AppColors.gold,
              dotColor: Color(0xff707070),
              dotWidth: 12,
              dotHeight: 12,

            ),
              onDotClicked: (index) {

              _pageController.animateToPage(index, duration: Durations.long1, curve: Curves.linear);
            },)
          ],
        ),
      ),
    );
  }
}
