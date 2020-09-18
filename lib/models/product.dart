import 'package:flutter/cupertino.dart';

class UnitModel {
  String id;
  String name;
  String category;
  String price;
  String imageUrl;

  UnitModel({this.name, this.id, this.price, this.imageUrl, this.category});
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
