import 'package:flutter/material.dart';
import 'package:uzotex_blind/service/back-button.dart';
import 'package:uzotex_blind/service/responsive-height-width.dart';
import 'package:uzotex_blind/widgets/secondary-logo.dart';
import 'package:uzotex_blind/widgets/signup-form.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
    children: [
      SizedBox(height: ResponsiveHeigthAndWidth.getHeigth(0.05, 0.05, context)),
      Row(
        children: [
          backButton(context),
        ],
      ),
      SizedBox(
        height: ResponsiveHeigthAndWidth.getHeigth(0.08, 0.00, context),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          secondaryLogo(context),
        ],
      ),
      SizedBox(
        height: ResponsiveHeigthAndWidth.getHeigth(0.09, 0.03, context),
      ),
      Expanded(
        child: SignUpForm(),
      ),
    ],
        ),
      );
  }
}
