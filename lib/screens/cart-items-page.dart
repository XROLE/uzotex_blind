import 'package:flutter/material.dart';
import 'package:uzotex_blind/service/app-colors.dart';
import 'package:uzotex_blind/widgets/loader.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart item Page')),
          body: Container(
        child: Center(child: loader( Color(AppColor.primaryColor()), 50.0),),
      ),
    );
  }
}