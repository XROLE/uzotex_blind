import 'package:flutter/material.dart';

import 'first-screen.dart';

class OnboardingScreens extends StatefulWidget {
  OnboardingScreens({Key key}) : super(key: key);

  _OnboardingScreensState createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  PageController _pageController;

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
          children: [
            HomeScreens().firstHomeScreen(),
            HomeScreens().secondHomeScreen(),
            HomeScreens().thirdHomeScreen(),
          ],
        ),
      ),
    );
  }
}
