import 'package:flutter/material.dart';
import 'package:uzotex_blind/service/back-button.dart';
import 'package:uzotex_blind/service/responsive-height-width.dart';
import 'package:uzotex_blind/widgets/secondary-logo.dart';
import 'package:uzotex_blind/widgets/signin-form.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();

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
        child: SignInForm(),
      ),
    ],
        ),
      );
  }
}
