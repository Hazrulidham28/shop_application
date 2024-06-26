import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_application/provider/products_provider.dart';
import 'product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  ProductsGrid(this.showFavs);
  @override
  Widget build(BuildContext context) {
    //user provider
    //<> tell to listen Products

    //call the provider in the provider class of products
    final productsData = Provider.of<Products>(context);

    final products = showFavs ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProductItem(
            // id: products[i].id,
            // title: products[i].title,
            // imageUrl: products[i].imageUrl,
            ),
      ),
      itemCount: products.length,
      padding: const EdgeInsets.all(10.0),
    );
  }
}
