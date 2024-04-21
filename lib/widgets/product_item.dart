import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_application/provider/cart.dart';
import 'package:shop_application/provider/product.dart';
import 'package:shop_application/screen/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // const ProductItem(
  //    {required this.id, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      //use clipreact to make it more rounded corner
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            //forward an id to product detail screen using named route
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          //leading is at the left
          leading: IconButton(
            onPressed: () {
              product.toggleFavouriteStatus();
            },
            icon: Icon(
              product.isFavourite ? Icons.favorite : Icons.favorite_border,
            ),
            color: Colors.deepOrange,
          ),
          //background color of footer
          backgroundColor: Colors.black38,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          //trailing at the right
          trailing: IconButton(
            onPressed: () {
              cart.addItem(product.id, product.price, product.title);
              //establish connection to nearese widget layout
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Added item to cart',
                    textAlign: TextAlign.center,
                  ),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            icon: Icon(Icons.shopping_cart),
            //need to set accent color as secondary color
            color: Colors.deepOrange,
          ),
        ),
      ),
    );
  }
}
