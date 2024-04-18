import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    //extract id from pushedNamed
    final productId = ModalRoute.of(context)!.settings.arguments as String;

    //get data using id
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
