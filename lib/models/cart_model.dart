import 'package:flutter/material.dart';
import 'package:nike_store/models/shoe_model.dart';

class Cart extends ChangeNotifier{
  //List of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
        name: 'Zoom FREAK',
        price: '236',
        imagePath: 'assets/images/sneakers-1.png',
        description: 'The forward-thinking design of latest signature shoe'),
    Shoe(
        name: 'Air Jordan',
        price: '220',
        imagePath: 'assets/images/sneakers-2.jpg',
        description: 'The forward-thinking design of latest signature shoe'),
    Shoe(
        name: 'KD Treys',
        price: '190',
        imagePath: 'assets/images/sneakers-3.png',
        description: 'The forward-thinking design of latest signature shoe'),
    Shoe(
        name: 'Kyrie 6',
        price: '290',
        imagePath: 'assets/images/sneakers-4.png',
        description: 'The forward-thinking design of latest signature shoe'),
  ];

//List of items in user cart
  List<Shoe> userCart = [];

//get listof shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

//get cart items
  List<Shoe> getUserCart() {
    return userCart;
  }

//add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

//remove items from cart
  void removeFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
