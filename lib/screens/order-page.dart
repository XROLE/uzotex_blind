import 'package:flutter/material.dart';
import 'package:uzotex_blind/service/app-colors.dart';

class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(AppColor.primaryColor()),
        title: Text(
          'My Orders',
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: Container(
        child: Center(
          child: Text(
            'Comming soon',
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}
