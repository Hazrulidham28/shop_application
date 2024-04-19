import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    //extract id from pushedNamed
    final productId = ModalRoute.of(context)!.settings.arguments as String;

    //get data using id from provider by usign firstwhere
    //will rerun when provided object changed if set the listen to true, false will not rebuild and not intrested in update
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}
