import 'package:flutter/cupertino.dart';

class Blinds {
  String name;
  int id;
  int quantity;
  String imageUrl;
  // You can add a list or array of samples that the window blind contain here

  Blinds({this.name, this.id, this.quantity, this.imageUrl});
}

class Category {
  @required String uid;
  @required String name;
  @required String image;

  Category({this.uid,this.name, this.image});
}
