import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_application/provider/cart.dart';
import '../provider/cart.dart' show Cart;
import '../widgets/cart_item.dart' as wd;

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'total',
                    style: TextStyle(fontSize: 20),
                  ),
                  //to make space between the children in row
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount}',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('ORDER NOW'),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, i) => wd.CartItem(
                cart.items.values.toList()[i].id,
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].quantity,
                cart.items.values.toList()[i].title,
              ),
              itemCount: cart.items.length,
            ),
          )
        ],
      ),
    );
  }
}
