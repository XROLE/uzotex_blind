import 'package:flutter/cupertino.dart';

class UnitModel {
  String id;
  String name;
  String category;
  String price;
  String imageUrl;

  UnitModel({this.name, this.id, this.price, this.imageUrl, this.category});
}

class CartItem {
  String id;
  int heigth;
  int width;
  int area;
  int numWin;
  String price;
  String category;
  String imageUrl;
  int total;

  CartItem({
    this.id,
    this.heigth,
    this.width,
    this.area,
    this.numWin,
    this.price,
    this.category,
    this.imageUrl,
    this.total,
  });
}

class Category {
  @required
  String uid;
  @required
  String name;
  @required
  String image;

  Category({this.uid, this.name, this.image});
}
