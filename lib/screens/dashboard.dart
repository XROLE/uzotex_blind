import 'package:flutter/material.dart';
import 'package:uzotex_blind/screens/home.dart';
import 'package:uzotex_blind/service/firebase-auth.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: FlatButton(
            onPressed: () async {
              await AuthService().signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
            },
            child: Text('Logout'),
          ),
        ),
      ),
    );
  }
}
