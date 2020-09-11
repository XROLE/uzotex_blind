import 'package:flutter/material.dart';
import 'package:uzotex_blind/service/app-colors.dart';
import 'package:uzotex_blind/service/inpute-decoration.dart';
import 'package:uzotex_blind/service/responsive-height-width.dart';
import 'package:uzotex_blind/service/validator.dart';

class CreateCategory extends StatefulWidget {
  @override
  _CreateCategoryState createState() => _CreateCategoryState();
}

class _CreateCategoryState extends State<CreateCategory> {
  final _formKey = GlobalKey<FormState>();
  String _categoryName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(AppColor.primaryColor()),
        title: Center(
          child: Text('CREATE CATEGORY'),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: ResponsiveHeigthAndWidth.getHeigth(0.10, 0.08, context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                child: Center(
                    child: Text(
                  'Select Image',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                )),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Color(AppColor.secondaryColor()),
                        spreadRadius: 1),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 140),
                child: IconButton(
                  icon: Icon(Icons.camera_alt),
                  color: Colors.grey,
                  iconSize: 40,
                  onPressed: () {},
                ),
              )
            ],
          ),
          Form(
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
                    style: TextStyle(fontSize: 18),
                    decoration: decorateInpute('Catergory Name'),
                    onChanged: (value) {
                      setState(() {
                        _categoryName = value;
                      });
                    },
                    validator: (value) {
                      return Validator.validateEmailField(value);
                    },
                  ),
                ),
                SizedBox(height: ResponsiveHeigthAndWidth.getWidth(0.10, 0.05, context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color(AppColor.secondaryColor()),
                              spreadRadius: 3)
                        ],
                      ),
                      child: FlatButton(
                        child: Text(
                          'Create',
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 2,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color(AppColor.primaryColor()),
                              spreadRadius: 2)
                        ],
                      ),
                      child: FlatButton(
                        child: Text(
                          'Canceal',
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 2,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ResponsiveHeigthAndWidth.getWidth(0.10, 0.05, context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
