import 'package:flutter/material.dart';
import 'package:uzotex_blind/service/app-colors.dart';
import 'package:uzotex_blind/service/responsive-height-width.dart';
import 'package:uzotex_blind/service/validator.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String _password = '';

  InputDecoration _decoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(
          AppColor.secondaryColor(),
        ),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 1.0),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(
            AppColor.secondaryColor(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        width: 500,
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              TextFormField(
                style: TextStyle(fontSize: 18),
                decoration: _decoration('Email'),
                validator: (value) {
                  return Validator.validateEmailField(value);
                },
              ),
              SizedBox(
                height: ResponsiveHeigthAndWidth.getHeigth(0.02, 0.03, context),
              ),
              TextFormField(
                obscureText: true,
                style: TextStyle(fontSize: 18),
                decoration: _decoration('Password'),
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
                validator: (value) {
                  return Validator.validatePasswordField(value);
                },
              ),
              SizedBox(
                height: ResponsiveHeigthAndWidth.getHeigth(0.02, 0.03, context),
              ),
              TextFormField(
                obscureText: true,
                style: TextStyle(fontSize: 18),
                decoration: _decoration('Confirm Password'),
                validator: (value) {
                  return Validator.validateConfirmPasswordField(
                      _password, value);
                },
              ),
              SizedBox(
                height: ResponsiveHeigthAndWidth.getHeigth(0.04, 0.10, context),
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                color: Color(AppColor.primaryColor()),
                onPressed: () {
                  print(
                      'I am a chosen one printing value of _password: ===> $_password');
                  if (_formKey.currentState.validate()) {
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')));
                  }
                },
                child: Text(
                  'REGISTER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(fontSize: 16),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(
                            AppColor.secondaryColor(),
                          )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
