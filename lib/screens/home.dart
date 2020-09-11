import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:uzotex_blind/service/app-colors.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              height: 200,
              width: double.infinity,
              color: Color(AppColor.primaryColor()),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 25, left: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Text(
                      'Uzotex Blinds',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 4,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
                child: Text(
              'AVAILABLE PRODUCTS',
              style: TextStyle(fontSize: 18, letterSpacing: 4),
            )),
            Center(
              child: ListView(
                shrinkWrap: true,
                // scrollDirection: Axis.horizontal,
                children: [
                  Text('I am a chosen one'),
                  Text('I am a chosen one'),
                  Text('I am a chosen one'),
                  Text('I am a chosen one'),
                  Text('I am a chosen one'),
                  Text('I am a chosen one'),
                  Text('I am a chosen one'),
                  Text('I am a chosen one'),
                ],
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Color(AppColor.secondaryColor()),
                          spreadRadius: 1)
                    ],
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/create-category');
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                      child: Text(
                        'Checkout',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 3,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
