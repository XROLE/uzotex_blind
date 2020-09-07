import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:uzotex_blind/components/mailer.dart';

class BookingForm extends StatefulWidget {
  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm>
    with SingleTickerProviderStateMixin {
  final emailController = TextEditingController();
  final blindIdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  AnimationController _controller;
  Animation _animation;

  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 100.0, end: 20.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    emailController.dispose();
    blindIdController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 1,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: _animation.value / 4),
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      final checkMail = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if (value.isEmpty) {
                        return 'Please provide an email';
                      } else if (!checkMail.hasMatch(value)) {
                        return 'Email is not valid';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.black),
                      contentPadding: EdgeInsets.symmetric(vertical: 1.0),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange[400]),
                      ),
                    ),
                    focusNode: _focusNode,
                  ),
                  SizedBox(height: _animation.value / 4),
                  TextFormField(
                    controller: blindIdController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'ID can not be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'ID',
                      labelStyle: TextStyle(color: Colors.black),
                      contentPadding: EdgeInsets.symmetric(vertical: 1.0),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange[400])),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  RaisedButton(
                    padding: EdgeInsets.all(0.0),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        sendMail(
                          emailController.text.trim(),
                          blindIdController.text.trim(),
                        );

                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Booked Succesfully!'),
                        ));

                        blindIdController.clear();
                        emailController.clear();
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange[400],
                      ),
                      child: Row(
                        children: [
                          Text('Send Booking', style: TextStyle(color: Colors.white, fontSize: 16),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
