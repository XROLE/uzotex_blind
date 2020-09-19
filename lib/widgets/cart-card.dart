import 'package:flutter/material.dart';
import 'package:uzotex_blind/service/app-colors.dart';
import 'package:uzotex_blind/service/responsive-height-width.dart';

class CartCard extends StatelessWidget {
  String image;

  CartCard({@required this.image});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        height: ResponsiveHeigthAndWidth.getHeigth(0.22, 0.36, context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: ResponsiveHeigthAndWidth.getHeigth(0.18, 0.36, context),
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: ResponsiveHeigthAndWidth.getWidth(0.36, 0.36, context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: ResponsiveHeigthAndWidth.getHeigth(0.015, 0.03, context),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'BOSS ORANGE 234',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ]),
                        SizedBox(
                          height: ResponsiveHeigthAndWidth.getHeigth(0.007, 0.007, context),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {},
                            ),
                            SizedBox(
                              width: ResponsiveHeigthAndWidth.getWidth(0.07, 0.05, context),
                            ),
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(
                          height: ResponsiveHeigthAndWidth.getHeigth(0.007, 0.007, context),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              color: Color(AppColor.primaryColor()),
                              child: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {},
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: ResponsiveHeigthAndWidth.getWidth(0.04, 0.03, context),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              color: Color(AppColor.secondaryColor()),
                              child: IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {},
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: ResponsiveHeigthAndWidth.getWidth( 0.2, 0.2, context),
              child: Column(
                children: [
                  SizedBox(
                    height: ResponsiveHeigthAndWidth.getHeigth(0.02, 0.04, context),
                  ),
                  Text('# 750', style: TextStyle(fontWeight: FontWeight.bold)),
                 SizedBox(
                    height: ResponsiveHeigthAndWidth.getHeigth(0.04, 0.06, context),
                  ),
                  Text(
                    '3',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: ResponsiveHeigthAndWidth.getHeigth(0.04, 0.08, context),
                  ),
                  Text(
                    '# 2250',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
