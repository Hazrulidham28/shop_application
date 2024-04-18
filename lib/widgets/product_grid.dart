import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_application/provider/products_provider.dart';
import 'product_item.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //user provider
    //<> tell to listen Products
    final productsData = Provider.of<Products>(context);

    final products = productsData.items;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (ctx, i) => ProductItem(
          id: products[i].id,
          title: products[i].title,
          imageUrl: products[i].imageUrl),
      itemCount: products.length,
      padding: const EdgeInsets.all(10.0),
    );
  }
}
