import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uzotex_blind/models/product.dart';
import 'package:uzotex_blind/service/app-colors.dart';
import 'package:uzotex_blind/service/database.dart';
import 'package:uzotex_blind/widgets/products-grid.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(AppColor.primaryColor()),
        title: Text(
          'Products',
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.add_shopping_cart_outlined), onPressed: () {})
        ],
      ),
      body: Container(
          color: Colors.white10,
          child: Container(
            child: ProductGrid(),
          )),
    );
  }
}
