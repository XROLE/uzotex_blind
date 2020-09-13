import 'dart:io';

import 'package:flutter/material.dart';
import 'package:uzotex_blind/service/app-colors.dart';
import 'package:uzotex_blind/service/database.dart';
import 'package:uzotex_blind/service/firebase-storage.dart';
import 'package:uzotex_blind/service/image-picker.dart';
import 'package:uzotex_blind/service/inpute-decoration.dart';
import 'package:uzotex_blind/service/responsive-height-width.dart';
import 'package:uzotex_blind/service/validator.dart';
import 'package:uzotex_blind/widgets/add-unit.dart';
import 'package:uzotex_blind/widgets/create-category.dart';
import 'package:uzotex_blind/widgets/loader.dart';


class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  bool _showSpinner = false;
  bool _addUnit = false;
  String _error = '';
  File _imageFile;
  final _formKey = GlobalKey<FormState>();
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
