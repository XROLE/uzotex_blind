import 'package:flutter/material.dart';
import 'package:uzotex_blind/screens/user-navigation.dart';
import 'package:uzotex_blind/service/app-colors.dart';
import 'package:uzotex_blind/service/firebase-auth.dart';
import 'package:uzotex_blind/service/responsive-height-width.dart';
import 'package:uzotex_blind/service/validator.dart';
import 'package:uzotex_blind/widgets/loader.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  bool _showSpinner = false;
  String _email = '';
  String _password = '';
  String _error = '';

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
                onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                    _error = '';
                  });
                },
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
                    _password = value.trim();
                    _error = '';
                  });
                },
                validator: (value) {
                  return value.isEmpty ? 'Password can not be empty' : null;
                },
              ),
              SizedBox(
                height: ResponsiveHeigthAndWidth.getHeigth(0.04, 0.03, context),
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                color: _showSpinner
                    ? Colors.white70
                    : Color(AppColor.primaryColor()),
                onPressed: _showSpinner
                    ? () {}
                    : () async {
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            _showSpinner = true;
                          });
                          dynamic result = await AuthService()
                              .signInWithEmail(_email, _password);
                          if (result == null) {
                            setState(() {
                              _error = 'Invalid Email or password';
                              _showSpinner = false;
                            });
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NavigateUser()),
                            );
                          }
                        }
                      },
                child: _showSpinner
                    ? loader(Color(AppColor.primaryColor()), 20)
                    : Text(
                        'SIGN IN',
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
                    'Don\'t have an account?',
                    style: TextStyle(fontSize: 16),
                  ),
                  FlatButton(
                    onPressed: () {
                      return Navigator.pushNamed(context, '/signup');
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(
                            AppColor.secondaryColor(),
                          )),
                    ),
                  ),
                ],
              ),
              Center(
                  child: Text(
                _error,
                style: TextStyle(color: Colors.red, fontSize: 18),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
