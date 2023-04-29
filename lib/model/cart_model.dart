import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{
  // list of items on sale 
  final List _shopItems = [
//[itemName, itemPrice, imagePath, color]
 ["Avocado","9.00","lib/images/avocado.png", Colors.green],
 ["Banana","10.00","lib/images/banana.png", Colors.yellow],
 ["chicken","15.00","lib/images/chicken.png", Colors.brown],
 ["water","6.00","lib/images/water.png", Colors.blue],
  ];

  //List of cart items
  List _cartItems =[];
  get shopItems => _shopItems;

  get cartItems => _cartItems;

  //add item to cart 
 void addItemToCart( int index){
  _cartItems.add(_shopItems[index]);
  notifyListeners();
 }
  // remove item from cart 
void removeItemFromCart(int index){
  _cartItems.removeAt(index);
  notifyListeners();
}
  //calculate total price 
  String calculateTotal(){
    double totalPrice = 0;
    for (int i=0; i < _cartItems.length; i++){
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}