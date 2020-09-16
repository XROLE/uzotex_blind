import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:uzotex_blind/models/user.dart';
import 'package:uzotex_blind/screens/cart-items-page.dart';
import 'package:uzotex_blind/screens/add-product.dart';
import 'package:uzotex_blind/screens/dashboard.dart';
import 'package:uzotex_blind/screens/onboarding-screens.dart';
import 'package:uzotex_blind/screens/product-page.dart';
import 'package:uzotex_blind/screens/sign-up.dart';
import 'package:uzotex_blind/screens/signin.dart';
import 'package:uzotex_blind/screens/user-navigation.dart';
import 'package:uzotex_blind/service/firebase-auth.dart';
import 'package:uzotex_blind/service/firebase-init.dart';

Future main() async {
  await DotEnv().load('.env');
  await initFirebase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext  context) {
    return StreamProvider<AppUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Uzotex_blind',
        initialRoute: '/',
        routes: {
          '/': (context) => OnboardingScreens(),
          '/cart-page': (context) => CartPage(),
          '/products': (context) => Products(),
          '/add-product': (context) => AddProduct(),
          '/dashboard': (context) => Dashboard(),
          '/navigate-user': (context) => NavigateUser(),
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
