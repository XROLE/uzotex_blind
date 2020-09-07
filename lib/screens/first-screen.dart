import 'package:flutter/material.dart';

class HomeScreens {
  Container firstHomeScreen() {
    return Container(
      child: ListView(children: [
        Center(
          child: Column(
            children: [
              Container(
                height: 100,
                margin: const EdgeInsets.only(top: 250),
                child: Image(
                  image: AssetImage('assets/images/uzotex_logo.png'),
                ),
              ),
              Text(
                'UZOTEX BLINDS',
                style: TextStyle(color: Colors.black),
              ),
              Container(
                margin: const EdgeInsets.only(top: 220),
                child: Text('\u00a9 Xrole'),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Container secondHomeScreen() {
    return Container(
      color: Colors.white,
      child: Center(
          child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 180,
              ),
              Container(
                height: 38,
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
            height: 70,
          ),
          Container(
            child: Center(
              child: Text(
                'WINDOW BLIND IN',
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '2',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'hours',
                  style: TextStyle(fontSize: 38, letterSpacing: 13),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }

  Stack thirdHomeScreen() {
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
        top: 50,
        left: 40,
        child: Row(
          children: [
            Container(
              height: 38,
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
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 5,
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: 590,
        left: 95,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Text(
                'Book Now',
                style: TextStyle(
                  fontSize: 22,
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
