import 'package:flutter/material.dart';
import 'package:shop_application/provider/cart.dart';
import 'package:shop_application/provider/orders.dart';
import 'package:shop_application/screen/cart_screen.dart';
import 'package:shop_application/screen/orders_screen.dart';
import 'package:shop_application/screen/product_detail_screen.dart';
import 'package:shop_application/screen/products_overview_screen.dart';
import 'package:provider/provider.dart';
import './provider/products_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //to use multiple provider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          //use create instead of build
          //refer to products class that contain the data
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          //provider for cart
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          //provider for cart
          create: (ctx) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        debugShowCheckedModeBanner: false,

        //add route to main dart
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          OrderScreen.routeName: (context) => OrderScreen(),
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
