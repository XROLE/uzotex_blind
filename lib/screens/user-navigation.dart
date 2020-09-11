import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uzotex_blind/models/user.dart';
import 'package:uzotex_blind/screens/home.dart';
import 'package:uzotex_blind/screens/signin.dart';

class NavigateUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context, listen: false);
    if (user == null) {
      return SignIn();
    } else {
      return Home();
    }
  }
}
