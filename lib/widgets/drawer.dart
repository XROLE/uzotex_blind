import 'package:flutter/material.dart';
import 'package:uzotex_blind/screens/user-navigation.dart';
import 'package:uzotex_blind/service/app-colors.dart';
import 'package:uzotex_blind/service/firebase-auth.dart';
import 'package:uzotex_blind/service/responsive-height-width.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(
            height: ResponsiveHeigthAndWidth.getHeigth(0.05, 0.03, context)),
        IconButton(
          icon: Icon(Icons.close),
          color: Color(
            AppColor.primaryColor(),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        SizedBox(
          height: ResponsiveHeigthAndWidth.getHeigth(0.05, 0.03, context),
        ),
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/signin');
          },
          child: Text(
            'Login',
            style: TextStyle(fontSize: 19),
          ),
        ),
        FlatButton(
          onPressed: () async {
            await AuthService().signOut();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => NavigateUser()),
            );
          },
          child: Text(
            'Logout',
            style: TextStyle(fontSize: 19),
          ),
        ),
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/add-product');
          },
          child: Text(
            'Add Product',
            style: TextStyle(fontSize: 19),
          ),
        ),
      ],
    );
  }
}
