import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uzotex_blind/models/product.dart';
import 'package:uzotex_blind/service/app-colors.dart';
import 'package:uzotex_blind/service/database.dart';
import 'package:uzotex_blind/service/firebase-storage.dart';
import 'package:uzotex_blind/service/generate-id.dart';
import 'package:uzotex_blind/service/get-category-path.dart';
import 'package:uzotex_blind/service/image-picker.dart';
import 'package:uzotex_blind/service/inpute-decoration.dart';
import 'package:uzotex_blind/service/responsive-height-width.dart';
import 'package:uzotex_blind/service/validator.dart';
import 'package:uzotex_blind/widgets/loader.dart';

class Unit extends StatefulWidget {
  @override
  _UnitState createState() => _UnitState();
}

class _UnitState extends State<Unit> {
  bool _showSpinner = false;
  List<String> _categories = [];
  String _error = '';
  File _imageFile;
  final _formKey = GlobalKey<FormState>();
  final idController = TextEditingController();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final categoryController = TextEditingController();
  String dropDownDefault = 'Select Country';
  String dropDownValue = 'Select Country';
  final _id = TextEditingController();

  void dispose() {
    nameController.dispose();
    priceController.dispose();
    categoryController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Category>>.value(
      value: DatabaseService().getCategories,
      child: Container(
        child: ListView(
          children: [
            SizedBox(
              height: ResponsiveHeigthAndWidth.getHeigth(0.08, 0.08, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: Column(
                    children: [
                      Center(
                        child: _imageFile == null
                            ? Container(
                                height: 70,
                              )
                            : Image.file(
                                _imageFile,
                                height: 150,
                                width: 190,
                                fit: BoxFit.fill,
                              ),
                      ),
                      Center(
                          child: FlatButton(
                        onPressed: () async {
                          File selectedImage = await getImage(false);
                          setState(() {
                            _imageFile = selectedImage;
                            _error = '';
                          });
                        },
                        child: Text(
                          'Select Image',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      )),
                    ],
                  ),
                  decoration: _imageFile == null
                      ? BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Color(AppColor.secondaryColor()),
                                spreadRadius: 1),
                          ],
                        )
                      : null,
                ),
                Container(
                  margin: EdgeInsets.only(top: 140),
                  child: IconButton(
                    icon: Icon(Icons.camera_alt),
                    color: Colors.grey,
                    iconSize: 40,
                    onPressed: () async {
                      File selectedImage = await getImage(true);
                      setState(() {
                        _imageFile = selectedImage;
                      });
                    },
                  ),
                )
              ],
            ),
            Builder(builder: (BuildContext context) {
              final blindsCategories = Provider.of<List<Category>>(context);
              final cartList =
                  blindsCategories.map((category) => category.name).toList();
              final cartid = blindsCategories.map((category) {
                return {
                  category.name: category.uid,
                };
              }).toList();

              cartList.add('Select Country');

              return Form(
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: [
                    SizedBox(
                      height: ResponsiveHeigthAndWidth.getHeigth(
                          0.05, 0.12, context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 200,
                          padding: EdgeInsets.symmetric(
                            horizontal: ResponsiveHeigthAndWidth.getWidth(
                                0.07, 0.03, context),
                          ),
                          child: TextFormField(
                            controller: nameController,
                            style: TextStyle(fontSize: 18),
                            decoration: decorateInpute('Name'),
                            onChanged: (value) {
                              setState(() {
                                _error = '';
                              });
                            },
                            validator: (value) {
                              return Validator.validateField(value);
                            },
                          ),
                        ),
                        Container(
                          width: 200,
                          padding: EdgeInsets.symmetric(
                            horizontal: ResponsiveHeigthAndWidth.getWidth(
                                0.07, 0.03, context),
                          ),
                          child: DropdownButton(
                            value: dropDownValue,
                            style: TextStyle(
                                color: Colors.deepPurple, fontSize: 18),
                            underline:
                                Container(height: 2, color: Colors.black12),
                            onChanged: (String newValue) {
                              if (newValue != dropDownDefault) {
                                setState(() {
                                  dropDownValue = newValue;
                                  categoryController.text = newValue;
                                  _id.text = newValue +
                                      ' ' +
                                      generateUniqueId([0, 5]).toString();
                                });
                              }
                            },
                            items: cartList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ResponsiveHeigthAndWidth.getHeigth(
                          0.02, 0.08, context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 200,
                          padding: EdgeInsets.symmetric(
                            horizontal: ResponsiveHeigthAndWidth.getWidth(
                                0.07, 0.03, context),
                          ),
                          child: TextFormField(
                            readOnly: true,
                            controller: _id,
                            style: TextStyle(fontSize: 18),
                            decoration: decorateInpute('ID'),
                          ),
                        ),
                        Container(
                          width: 200,
                          padding: EdgeInsets.symmetric(
                            horizontal: ResponsiveHeigthAndWidth.getWidth(
                                0.07, 0.03, context),
                          ),
                          child: TextFormField(
                            controller: priceController,
                            style: TextStyle(fontSize: 18),
                            keyboardType: TextInputType.number,
                            decoration: decorateInpute('Price'),
                            onChanged: (value) {
                              setState(() {
                                _error = '';
                              });
                            },
                            validator: (value) {
                              return Validator.validateField(value);
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: ResponsiveHeigthAndWidth.getWidth(
                            0.10, 0.06, context)),
                    _showSpinner
                        ? loader(Color(AppColor.primaryColor()), 50)
                        : Container(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: _showSpinner
                                      ? Colors.white
                                      : Color(AppColor.secondaryColor()),
                                  spreadRadius: 3)
                            ],
                          ),
                          child: Builder(
                            builder: (BuildContext context) {
                              return FlatButton(
                                child: Text(
                                  _showSpinner ? '' : 'Create',
                                  style: TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 2,
                                  ),
                                ),
                                onPressed: _showSpinner
                                    ? () {}
                                    : () async {
                                        if (_formKey.currentState.validate() &&
                                            _imageFile != null) {
                                          setState(() {
                                            _showSpinner = true;
                                          });
                                          String uploadedImageUrl =
                                              await CloudStorageService()
                                                  .uploadImage(
                                            imageToUpload: _imageFile,
                                            title: nameController.text.trim(),
                                          );
                                          final categoryId =
                                              getSelectedCategoryDetails(
                                                  cartid, dropDownValue);
                                          print(
                                              "I am a chosen one cart Id ===> ${categoryId[categoryController.text]}");
                                          await DatabaseService().createUnit(
                                            nameController.text.trim(),
                                            categoryController.text.trim(),
                                            _id.text,
                                            uploadedImageUrl,
                                            priceController.text.trim(),
                                            categoryId[categoryController.text.trim()],
                                          );

                                          Scaffold.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  '${_id.text} Added Successfuly'),
                                            ),
                                          );

                                          idController.clear();
                                          nameController.clear();
                                          priceController.clear();
                                          categoryController.clear();
                                          setState(() {
                                            _imageFile = null;
                                            _id.text = '';
                                            dropDownValue = dropDownDefault;
                                            _showSpinner = false;
                                          });
                                        } else if (_imageFile == null) {
                                          setState(() {
                                            _error =
                                                "Please provide category image";
                                          });
                                        } else if (categoryController.text ==
                                            '') {
                                          setState(() {
                                            _error = "Please Select Category";
                                          });
                                        } else {
                                          setState(() {
                                            _error =
                                                'Oops! Something went wrong';
                                          });
                                        }
                                        ;
                                      },

                                // ====================================================>
                              );
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: _showSpinner
                                      ? Colors.white
                                      : Color(AppColor.primaryColor()),
                                  spreadRadius: 2)
                            ],
                          ),
                          child: FlatButton(
                            child: Text(
                              _showSpinner ? '' : 'Canceal',
                              style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 2,
                              ),
                            ),
                            onPressed: _showSpinner
                                ? () {}
                                : () {
                                    idController.clear();
                                    nameController.clear();
                                    priceController.clear();
                                    categoryController.clear();
                                    setState(() {
                                      _imageFile = null;
                                      _error = '';
                                      _id.text = '';
                                      dropDownValue = dropDownDefault;
                                    });
                                  },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: ResponsiveHeigthAndWidth.getWidth(
                            0.10, 0.05, context)),
                    Center(
                      child: Text(
                        _error,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(
                            AppColor.primaryColor(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: ResponsiveHeigthAndWidth.getWidth(
                            0.10, 0.05, context)),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
