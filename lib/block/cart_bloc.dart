import 'package:flutter/cupertino.dart';
import 'package:uzotex_blind/models/product.dart';

class CartBloc extends ChangeNotifier {
  List<CartItem> _cartValue = [];

  List<CartItem> get cartValue => _cartValue;

  void addToCart(CartItem unit) {
    _cartValue.add(unit);
  }

  void deleteCartItem(String id) {
    _cartValue.removeWhere((item) => item.id == id);
  }

  void editCartItem(String id){
  }
}
