import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:uzotex_blind/service/app-colors.dart';
import 'package:uzotex_blind/service/responsive-height-width.dart';
import 'package:uzotex_blind/widgets/drawer.dart';
import 'package:uzotex_blind/widgets/sample_blinds_carousel.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: AppDrawer(),
      ),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              height: ResponsiveHeigthAndWidth.getHeigth(0.25, 0.40, context),
              width: double.infinity,
              color: Color(AppColor.primaryColor()),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 25, left: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Builder(
                        builder: (BuildContext context) {
                          return IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon: Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: 35,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveHeigthAndWidth.getHeigth(0.06, 0.06, context),
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
              height: ResponsiveHeigthAndWidth.getHeigth(0.05, 0.07, context),
            ),
            Center(
                child: Text(
              'AVAILABLE PRODUCTS',
              style: TextStyle(fontSize: 18, letterSpacing: 4),
            )),
             SizedBox(
              height: ResponsiveHeigthAndWidth.getHeigth(0.05, 0.08, context),
            ),
            ListView(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              children: [
                SampleBlindsCarousel(),
              ],
            ),
            SizedBox(height: ResponsiveHeigthAndWidth.getHeigth(0.05, 0.08, context) ),
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
                      Navigator.pushNamed(context, '/cart-page');
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: ResponsiveHeigthAndWidth.getWidth(0.15, 0.12, context), vertical: 15),
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
            SizedBox(height: ResponsiveHeigthAndWidth.getHeigth(0.05, 0.05, context),)
          ],
        ),
      ),
    );
  }
}
