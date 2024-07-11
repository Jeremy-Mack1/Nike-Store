import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_model.dart';
import '../models/shoe_model.dart';
class CartItem extends StatefulWidget {
  CartItem({super.key, required this.shoe});

  Shoe shoe;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10)
        ),
        child: ListTile(
          leading: Image.asset(widget.shoe.imagePath),
          title: Text(widget.shoe.name),
          subtitle: Text(widget.shoe.price),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Provider.of<Cart>(context, listen: false).removeFromCart(widget.shoe);
            },
          ),
        ),
      ),
    );
  }
}
