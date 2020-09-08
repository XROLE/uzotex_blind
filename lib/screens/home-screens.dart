import 'package:flutter/material.dart';
import 'package:uzotex_blind/service/app-colors.dart';
import 'package:uzotex_blind/service/page-view-indicator.dart';
import 'package:uzotex_blind/service/responsive-height-width.dart';

class HomeScreens {
  Container firstHomeScreen(context, currentPage) {
    return Container(
      child: ListView(children: [
        Center(
          child: Column(
            children: [
              Container(
                height: ResponsiveHeigthAndWidth.getHeigth(0.12, 0.18, context),
                margin: EdgeInsets.only(
                  top: ResponsiveHeigthAndWidth.getHeigth(
                    0.3,
                    0.1,
                    context,
                  ),
                ),
                child: Image(
                  image: AssetImage('assets/images/uzotex_logo.png'),
                ),
              ),
              Text(
                'UZOTEX BLINDS',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: ResponsiveHeigthAndWidth.getHeigth(0.3, 0.36, context),
              ),
              PageViewIndicator.indicator(3, currentPage),
              Container(
                margin: EdgeInsets.only(
                    top:
                        ResponsiveHeigthAndWidth.getHeigth(0.1, 0.07, context)),
                child: Text('\u00a9 Xrole'),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Container secondHomeScreen(context, currentPage) {
    return Container(
      child: Center(
          child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: ResponsiveHeigthAndWidth.getHeigth(0.2, 0.3, context),
              ),
              Container(
                height: ResponsiveHeigthAndWidth.getHeigth(0.05, 0.09, context),
                child: Image(
                  image: AssetImage('assets/images/uzotex_logo.png'),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Uzotex',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5,
                ),
              ),
            ],
          ),
          SizedBox(
            height: ResponsiveHeigthAndWidth.getHeigth(0.18, 0.08, context),
          ),
          Container(
            child: Center(
              child: Text(
                'WINDOW BLIND IN',
                style: TextStyle(
                    fontSize: ResponsiveHeigthAndWidth.getHeigth(
                        0.035, 0.04, context)),
              ),
            ),
          ),
          SizedBox(
            height: ResponsiveHeigthAndWidth.getHeigth(0.02, 0.03, context),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '2',
                  style: TextStyle(
                    fontSize:
                        ResponsiveHeigthAndWidth.getHeigth(0.08, 0.10, context),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'hours',
                  style: TextStyle(
                      fontSize: ResponsiveHeigthAndWidth.getHeigth(
                          0.05, 0.05, context),
                      letterSpacing: 13),
                )
              ],
            ),
          ),
          SizedBox(
              height: ResponsiveHeigthAndWidth.getHeigth(0.25, 0.20, context)),
          PageViewIndicator.indicator(3, currentPage),
        ],
      )),
    );
  }

  Stack thirdHomeScreen(context, currentPage) {
    return Stack(fit: StackFit.expand, children: [
      Container(
        color: Colors.red,
        child: Image(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/images/onboard_image.png',
          ),
        ),
      ),
      Container(
        color: Colors.black26,
        child: Text(''),
      ),
      Positioned(
        top: ResponsiveHeigthAndWidth.getHeigth(0.08, 0.08, context),
        left: ResponsiveHeigthAndWidth.getWidth(0.05, 0.05, context),
        child: Row(
          children: [
            Container(
              height: ResponsiveHeigthAndWidth.getHeigth(0.05, 0.07, context),
              child: Image(
                image: AssetImage(
                  'assets/images/uzotex_logo.png',
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Uzotex',
              style: TextStyle(
                fontSize:
                    ResponsiveHeigthAndWidth.getHeigth(0.028, 0.045, context),
                fontWeight: FontWeight.bold,
                letterSpacing: 5,
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: ResponsiveHeigthAndWidth.getHeigth(0.8, 0.70, context),
        left: ResponsiveHeigthAndWidth.getWidth(0.40, 0.45, context),
        child: PageViewIndicator.indicator(3, currentPage),
      ),
      Positioned(
        top: ResponsiveHeigthAndWidth.getHeigth(0.85, 0.80, context),
        left: ResponsiveHeigthAndWidth.getWidth(0.24, 0.33, context),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
          decoration: BoxDecoration(
              color: Color(AppColor.primaryColor()),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Text(
                'Book Now',
                style: TextStyle(
                  fontSize:
                      ResponsiveHeigthAndWidth.getHeigth(0.035, 0.05, context),
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
