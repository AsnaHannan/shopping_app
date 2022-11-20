import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/global.dart';
import 'package:shopping_app/providers/cart.dart';
import 'package:shopping_app/providers/orders.dart';
import 'package:shopping_app/providers/products_provider.dart';
import 'package:shopping_app/views/cart_page.dart';
import 'package:shopping_app/views/orders_page.dart';
import 'package:shopping_app/views/product_detail_page.dart';
import 'package:shopping_app/views/products_overview_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Shopping app',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: const ProductsOverviewPage(),
        initialRoute: '/',
        routes: {
          RouteNames.productDetailPageRoute: (ctx) => const ProductDetailPage(),
          RouteNames.cartPageRoute: (ctx) => const CartPage(),
          RouteNames.ordersPageRoute: (ctx) => const OrdersPage(),
        },
      ),
    );
  }
}
