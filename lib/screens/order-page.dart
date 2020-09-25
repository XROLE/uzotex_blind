import 'package:flutter/material.dart';
import 'package:uzotex_blind/screens/home.dart';
import 'package:uzotex_blind/service/app-colors.dart';
import 'package:uzotex_blind/service/responsive-height-width.dart';
import 'package:uzotex_blind/widgets/cart-card.dart';

class Orders extends StatelessWidget {
  final String image1 =
      'https://tse4.mm.bing.net/th?id=OIP.pkeF8SKbpbe_Ccw1JewIeQHaHa&pid=Api&P=0&w=300&h=300';
 final String image2 =
      'https://tse3.mm.bing.net/th?id=OIP.ntpwuPd7buTjNJh5euFZbQHaJQ&pid=Api&P=0&w=300&h=300';
 final String image3 =
      'https://tse1.mm.bing.net/th?id=OIP.g6hotM_rVDMWiTIHMbQaPwHaHa&pid=Api&P=0&w=300&h=300';
  final String image4 = 'http://artsweek.ca/wp-content/uploads/2018/05/window.jpg';
  final String image5 = 'http://i.ebayimg.com/images/i/301894077135-0-1/s-l1000.jpg';
  @override
  Widget build(BuildContext context) {
    SizedBox _widgetSpace = SizedBox(
        height: ResponsiveHeigthAndWidth.getHeigth(0.04, 0.08, context));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(AppColor.primaryColor()),
        title: Center(
          child: Text(
            'My Orders',
            style: TextStyle(fontSize: 22),
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.add_shopping_cart_outlined), onPressed: () {})
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: ResponsiveHeigthAndWidth.getHeigth(0.03, 0.06, context),
          left: ResponsiveHeigthAndWidth.getWidth(0.03, 0.08, context),
          right: ResponsiveHeigthAndWidth.getWidth(0.03, 0.08, context),
        ),
        child: ListView(
          children: [
            CartCard(image: image1),
            _widgetSpace,
            CartCard(image: image2),
            _widgetSpace,
            CartCard(image: image3),
            _widgetSpace,
            CartCard(image: image5),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '# 11,250',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal:
                      ResponsiveHeigthAndWidth.getWidth(0.03, 0.02, context)),
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 0),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                child: Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Color(AppColor.secondaryColor())),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: ResponsiveHeigthAndWidth.getWidth(
                            0.37, 0.37, context),
                        vertical: 20),
                    child: Text(
                      'Pay',
                      style: TextStyle(fontSize: 20),
                    )),
              ),
            ),
            _widgetSpace,
          ],
        ),
      ),
    );
  }
}
