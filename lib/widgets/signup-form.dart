import 'package:flutter/material.dart';
import 'package:uzotex_blind/screens/signin.dart';
import 'package:uzotex_blind/screens/user-navigation.dart';
import 'package:uzotex_blind/service/app-colors.dart';
import 'package:uzotex_blind/service/firebase-auth.dart';
import 'package:uzotex_blind/service/responsive-height-width.dart';
import 'package:uzotex_blind/service/validator.dart';
import 'package:uzotex_blind/widgets/loader.dart';


class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  bool _showSpinner = false;
  String _email = '';
  String _password = '';
  String _error = '';
  dynamic _registeredUser;

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
                    _email = value;
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
                    _password = value;
                    _error = '';
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
                onChanged: (value) {
                  setState(() {
                    _error = '';
                  });
                },
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
                              .registerWithEmail(_email, _password);
                          
                          setState(() {
                            _registeredUser = result;
                          });
                        }
                        if (_registeredUser.runtimeType != String) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NavigateUser(),
                            ),
                          );
                        } else {
                          setState(() {
                            _error = _registeredUser;
                            _showSpinner = false;
                          });
                        }
                      },
                child: _showSpinner
                    ? loader(Color(AppColor.primaryColor()), 25)
                    : Text(
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
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
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
