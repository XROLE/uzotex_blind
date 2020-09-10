import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uzotex_blind/models/user.dart';
import 'package:uzotex_blind/screens/dashboard.dart';
import 'package:uzotex_blind/screens/signin.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context, listen: false);
    if (user == null) {
      return SignIn();
    } else {
      return Dashboard();
    }
  }
}
