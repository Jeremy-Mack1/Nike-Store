import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:nike_store/models/shoe_model.dart';
import 'package:provider/provider.dart';

import '../models/cart_model.dart';
import '../widgets/shoe_tile.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: AnimSearchBar(
              width: 400,
              textController: _textController,
              onSuffixTap: () {
                setState(() {
                  _textController.clear();
                });
              },
              onSubmitted: (String) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Text(
              'Everyone flies... some fly longer than others',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hot Pics 🔥',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                'View All',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                Shoe shoe = value.getShoeList()[index];
                return ShoeTile(
                  shoe: shoe,
                  onTap: () {
                    addShoeToCart(shoe);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Item Added To Cart'),
      ),
    );
  }
}
