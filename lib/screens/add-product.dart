import 'dart:io';

import 'package:flutter/material.dart';
import 'package:uzotex_blind/service/app-colors.dart';
import 'package:uzotex_blind/widgets/add-unit.dart';
import 'package:uzotex_blind/widgets/create-category.dart';


class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  bool _addUnit = false;
  final nameController = TextEditingController();

  Widget _togglePage() {
    return _addUnit
        ? IconButton(
            onPressed: () {
              setState(() {
                _addUnit = !_addUnit;
              });
            },
            icon: Icon(Icons.mobile_friendly_rounded))
        : IconButton(onPressed: () {
          setState(() {
            _addUnit = !_addUnit;
          });
        }, icon: Icon(Icons.category));
  }

  @override
  void dispose() {
    nameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(AppColor.primaryColor()),
        title: Center(
          child: Text( _addUnit ? 'CREATE CATEGORY' : 'ADD UNIT'),
        ),
        actions: [_togglePage()],
      ),
      body: _addUnit ? CreateCategory() : Unit(),
    );
  }
}
