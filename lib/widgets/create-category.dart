import 'dart:io';

import 'package:flutter/material.dart';
import 'package:uzotex_blind/service/app-colors.dart';
import 'package:uzotex_blind/service/database.dart';
import 'package:uzotex_blind/service/firebase-storage.dart';
import 'package:uzotex_blind/service/image-picker.dart';
import 'package:uzotex_blind/service/inpute-decoration.dart';
import 'package:uzotex_blind/service/responsive-height-width.dart';
import 'package:uzotex_blind/service/validator.dart';
import 'package:uzotex_blind/widgets/loader.dart';

class CreateCategory extends StatefulWidget {
  @override
  _CreateCategoryState createState() => _CreateCategoryState();
}

class _CreateCategoryState extends State<CreateCategory> {
  bool _showSpinner = false;
  String _error = '';
  File _imageFile;
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  height:
                      ResponsiveHeigthAndWidth.getHeigth(0.05, 0.03, context),
                ),
                Container(
                  width: 500,
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        ResponsiveHeigthAndWidth.getWidth(0.10, 0.18, context),
                  ),
                  child: TextFormField(
                    controller: nameController,
                    style: TextStyle(fontSize: 18),
                    decoration: decorateInpute('Catergory Name'),
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
                SizedBox(
                    height:
                        ResponsiveHeigthAndWidth.getWidth(0.10, 0.05, context)),
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

                                      await DatabaseService().createCategory(
                                        nameController.text.trim(),
                                        uploadedImageUrl,
                                      );

                                      Scaffold.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              '${nameController.text.trim()} Added succesfuly'),
                                        ),
                                      );

                                      nameController.clear();
                                      setState(() {
                                        _imageFile = null;
                                        _showSpinner = false;
                                      });
                                    } else if (_imageFile == null) {
                                      setState(() {
                                        _error =
                                            "Please provide category image";
                                      });
                                    } else {
                                      setState(() {
                                        _error = 'Oops! Something went wrong';
                                      });
                                    }
                                  },
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
                                nameController.clear();
                                setState(() {
                                  _imageFile = null;
                                });
                              },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height:
                        ResponsiveHeigthAndWidth.getWidth(0.10, 0.05, context)),
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
                    height:
                        ResponsiveHeigthAndWidth.getWidth(0.10, 0.05, context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
