import 'package:flutter/material.dart';
import 'package:shop_application/screen/product_detail_screen.dart';
import 'package:shop_application/screen/products_overview_screen.dart';
import 'package:provider/provider.dart';
import './provider/products_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    return ChangeNotifierProvider(
      //use create instead of build
      //refer to products class that contain the data
      create: (ctx) => Products(),
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),

        //add route to main dart
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop App'),
      ),
      body: Center(
        child: Text('Shop app'),
      ),
    );
  }
}
