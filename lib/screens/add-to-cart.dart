import 'package:flutter/material.dart';
import 'package:uzotex_blind/models/product.dart';

class AddToCart extends StatefulWidget {
  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    UnitModel unitProduct = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Stack(children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(unitProduct.imageUrl, fit: BoxFit.cover,),
              ),
              Positioned(
                top: 30,
                left: 15,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  iconSize: 25,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ]),
          SizedBox(height: 20,),
          Container(
            child: Center(child: Text(unitProduct.id, style: TextStyle(fontSize: 22, letterSpacing: 2),),),
          )
          ],
        ),
      ),
    );
  }
}
