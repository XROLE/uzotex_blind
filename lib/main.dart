import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:uzotex_blind/screens/onboarding-screens.dart';
import 'package:uzotex_blind/screens/sign-up.dart';
import 'package:uzotex_blind/screens/signin.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uzotex_blind',
      initialRoute: '/',
      routes: {
        '/' : (context) => OnboardingScreens(),
        '/signup' : (context) => SignUp(),
        '/signin' : (context) => SignIn(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
