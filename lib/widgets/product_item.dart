import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const ProductItem(
      {required this.id, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      //use clipreact to make it more rounded corner
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          //leading is at the left
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
              color: Colors.deepOrange,
            ),
          ),
          //background color of footer
          backgroundColor: Colors.black38,
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          //trailing at the right
          trailing: Icon(
            Icons.shopping_cart,
            //need to set accent color as secondary color
            color: Colors.deepOrange,
          ),
        ),
      ),
    );
  }
}
