import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_model.dart';
import '../widgets/cart_item.dart';
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) =>
        Column(
        children: [
          Text('My Cart',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
          ),
          SizedBox(height: 20,),
          Expanded(child: ListView.builder(
            itemCount: value.userCart.length,
              itemBuilder: (context, index) {
                final individualShoe = value.getUserCart()[index];
                return CartItem(shoe: individualShoe,);
              },))
        ],
      ),);
  }
}
