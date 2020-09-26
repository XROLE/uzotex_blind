import 'package:flutter/material.dart';
import 'package:uzotex_blind/models/product.dart';
import 'package:uzotex_blind/screens/add-to-cart.dart';
import 'package:uzotex_blind/service/app-colors.dart';
import 'package:uzotex_blind/service/responsive-height-width.dart';

class UnitPage extends StatefulWidget {
  @override
  _UnitPageState createState() => _UnitPageState();
}

class _UnitPageState extends State<UnitPage> {
  @override
  Widget build(BuildContext context) {
    UnitModel unitProduct = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Container(
        height: ResponsiveHeigthAndWidth.getHeigth(0.95, 0.9, context),
        child: Stack(
          children: [
            Container(
              height: ResponsiveHeigthAndWidth.getHeigth(0.95, 0.9, context),
              width: double.infinity,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  unitProduct.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: ResponsiveHeigthAndWidth.getHeigth(0.05, 0.05, context),
              left: ResponsiveHeigthAndWidth.getWidth(0.03, 0.02, context),
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Positioned(
              top: ResponsiveHeigthAndWidth.getHeigth(0.73, 0.535, context),
              width: ResponsiveHeigthAndWidth.getWidth(1, 1, context),
              child: Container(
                height:
                    ResponsiveHeigthAndWidth.getHeigth(0.22, 0.363, context),
                decoration: BoxDecoration(
                  color: Color(AppColor.primaryColor()).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: ResponsiveHeigthAndWidth.getHeigth(
                          0.04, 0.06, context),
                    ),
                    Container(
                        child: Text(
                      unitProduct.id,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5,
                        color: Colors.white,
                      ),
                    )),
                    SizedBox(
                      height: ResponsiveHeigthAndWidth.getHeigth(
                          0.025, 0.025, context),
                    ),
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Text('Price: ',
                                style: TextStyle(
                                    fontSize: 22, color: Colors.white)),
                            Text('#${unitProduct.price}',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(AppColor.secondaryColor())
                                .withOpacity(0.5),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddToCart(),
                                    settings: RouteSettings(
                                        arguments: UnitModel(
                                      name: unitProduct.name,
                                      id: unitProduct.id,
                                      price: unitProduct.price,
                                      imageUrl: unitProduct.imageUrl,
                                      category: unitProduct.category,
                                    )),
                                  ));
                            },
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
