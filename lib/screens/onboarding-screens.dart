import 'package:flutter/material.dart';

import 'home-screens.dart';

class OnboardingScreens extends StatefulWidget {
  OnboardingScreens({Key key}) : super(key: key);

  _OnboardingScreensState createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              currentPage = index;
            });
          },
          children: [
            HomeScreens().firstHomeScreen(context, currentPage),
            HomeScreens().secondHomeScreen(context, currentPage),
            HomeScreens().thirdHomeScreen(context, currentPage),
          ],
        ),
      ),
    );
  }
}
