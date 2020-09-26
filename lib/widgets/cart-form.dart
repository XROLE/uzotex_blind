import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uzotex_blind/block/cart_bloc.dart';
import 'package:uzotex_blind/models/product.dart';
import 'package:uzotex_blind/screens/order-page.dart';
import 'package:uzotex_blind/service/app-colors.dart';
import 'package:uzotex_blind/service/responsive-height-width.dart';
import 'package:uzotex_blind/service/validator.dart';

class CartForm extends StatefulWidget {
  final String id;
  final String price;
  final String imageUrl;

  CartForm({@required this.id, @required this.price, @required this.imageUrl});
  @override
  _CartFormState createState() =>
      _CartFormState(id: id, price: price, imageUrl: imageUrl);
}

class _CartFormState extends State<CartForm> {
  final _formKey = GlobalKey<FormState>();
  final String id;
  final String price;
  final String imageUrl;
  final heigthController = TextEditingController();
  final widthController = TextEditingController();
  final numWinController = TextEditingController();
  final areaController = TextEditingController();
  final totalController = TextEditingController();

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
  _CartFormState(
      {@required this.id, @required this.price, @required this.imageUrl});

  void dispose() {
    heigthController.dispose();
    widthController.dispose();
    areaController.dispose();
    numWinController.dispose();
    totalController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CartBloc cartBloc = Provider.of<CartBloc>(context);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ResponsiveHeigthAndWidth.getWidth(0.03, 0.05, context)),
      child: Container(
        height: ResponsiveHeigthAndWidth.getHeigth(0.5, 0.5, context),
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
                    controller: heigthController,
                    style: TextStyle(fontSize: 16),
                    decoration: _decoration('Height'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        areaController.text =
                            (int.parse(value) * int.parse(widthController.text))
                                    .toString() +
                                ' Square Metre';
                        numWinController.text = '';
                        totalController.text = '';
                      });
                    },
                    validator: (value) {
                      return Validator.validateField(value);
                    },
                  ),
                ),
                Container(
                  width: ResponsiveHeigthAndWidth.getWidth(0.45, 0.45, context),
                  child: TextFormField(
                    controller: widthController,
                    style: TextStyle(fontSize: 16),
                    decoration: _decoration('Width'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        areaController.text = (int.parse(value) *
                                    int.parse(heigthController.text))
                                .toString() +
                            ' Square Meter';
                        numWinController.text = '';
                        totalController.text = '';
                      });
                    },
                    validator: (value) {
                      return Validator.validateField(value);
                    },
                  ),
                ),
              ]),
              _inputVerticalSpacing,
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                  width: ResponsiveHeigthAndWidth.getWidth(0.40, 0.40, context),
                  child: TextFormField(
                    controller: numWinController,
                    style: TextStyle(fontSize: 16),
                    decoration: _decoration('No of Windows'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        totalController.text = '#' +
                            (int.parse(value) *
                                    int.parse(price) *
                                    int.parse(
                                        areaController.text.split(' ').first))
                                .toString();
                      });
                    },
                    validator: (value) {
                      return Validator.validateField(value);
                    },
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
                  controller: areaController,
                  style: TextStyle(fontSize: 16),
                  readOnly: true,
                  decoration: _decoration('Square Meter'),
                ),
              ),
              _inputVerticalSpacing,
              Container(
                child: TextFormField(
                  controller: totalController,
                  style: TextStyle(fontSize: 16),
                  readOnly: true,
                  decoration: _decoration('Total'),
                ),
              ),
              _inputVerticalSpacing,
              FlatButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    CartItem unit = CartItem(
                      id: id,
                      price: price,
                      imageUrl: imageUrl,
                      width: int.parse(widthController.text),
                      heigth: int.parse(heigthController.text),
                      area: int.parse(areaController.text.split(' ').first),
                      numWin: int.parse(numWinController.text),
                      total: int.parse(totalController.text.split('#').last),
                    );

                    cartBloc.addToCart(unit);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Orders()),
                    );
                  }
                },
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
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
