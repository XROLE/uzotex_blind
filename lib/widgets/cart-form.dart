import 'package:flutter/material.dart';
import 'package:uzotex_blind/service/app-colors.dart';
import 'package:uzotex_blind/service/responsive-height-width.dart';

class CartForm extends StatefulWidget {
  String price;

  CartForm({@required this.price});
  @override
  _CartFormState createState() => _CartFormState(price: price);
}

class _CartFormState extends State<CartForm> {
  final _formKey = GlobalKey<FormState>();
  String price;

  InputDecoration _decoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      contentPadding: EdgeInsets.symmetric(horizontal: 15),
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(AppColor.secondaryColor()))),
    );
  }

  Widget _inputVerticalSpacing = SizedBox(height: 20);
  _CartFormState({@required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ResponsiveHeigthAndWidth.getWidth(0.03, 0.05, context)),
      child: Container(
        height: 500,
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                  width: ResponsiveHeigthAndWidth.getWidth(0.40, 0.40, context),
                  child: TextFormField(
                    style: TextStyle(fontSize: 16),
                    decoration: _decoration('Height'),
                  ),
                ),
                Container(
                  width: ResponsiveHeigthAndWidth.getWidth(0.45, 0.45, context),
                  child: TextFormField(
                    style: TextStyle(fontSize: 16),
                    decoration: _decoration('Width'),
                  ),
                ),
              ]),
              _inputVerticalSpacing,
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                  width: ResponsiveHeigthAndWidth.getWidth(0.40, 0.40, context),
                  child: TextFormField(
                    style: TextStyle(fontSize: 16),
                    decoration: _decoration('No of Windows'),
                  ),
                ),
                Container(
                  width: ResponsiveHeigthAndWidth.getWidth(0.45, 0.45, context),
                  child: TextFormField(
                    style: TextStyle(fontSize: 16),
                    readOnly: true,
                    decoration: _decoration('#$price'),
                  ),
                ),
              ]),
              _inputVerticalSpacing,
              Container(
                child: TextFormField(
                  style: TextStyle(fontSize: 16),
                  readOnly: true,
                  decoration: _decoration('13.5 Square Meter'),
                ),
              ),
              _inputVerticalSpacing,
              Container(
                child: TextFormField(
                  style: TextStyle(fontSize: 16),
                  readOnly: true,
                  decoration: _decoration('Total'),
                ),
              ),
              _inputVerticalSpacing,
              Container(
                child: TextFormField(
                  style: TextStyle(fontSize: 16),
                  decoration: _decoration('Phone Number'),
                  keyboardType: TextInputType.number,
                ),
              ),
              _inputVerticalSpacing,
              FlatButton(
                onPressed: () {},
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(AppColor.secondaryColor())),
                  ),
                  child: Text(
                    'Add To Cart',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
