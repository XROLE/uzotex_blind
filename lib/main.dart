import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:uzotex_blind/models/user.dart';
import 'package:uzotex_blind/screens/dashboard.dart';
import 'package:uzotex_blind/screens/home.dart';
import 'package:uzotex_blind/screens/onboarding-screens.dart';
import 'package:uzotex_blind/screens/sign-up.dart';
import 'package:uzotex_blind/screens/signin.dart';
import 'package:uzotex_blind/service/firebase-auth.dart';
import 'package:uzotex_blind/service/firebase-init.dart';

Future main() async {
  await DotEnv().load('.env');
  await initFirebase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Uzotex_blind',
        initialRoute: '/',
        routes: {
          '/': (context) => OnboardingScreens(),
          '/home': (context) => Home(),
          '/dashboard': (context) => Dashboard(),
          '/signup': (context) => SignUp(),
          '/signin': (context) => SignIn(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  }
}
