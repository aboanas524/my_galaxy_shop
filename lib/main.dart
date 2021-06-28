import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galaxy_shop_1/Providers/cart.dart';
import 'package:provider/provider.dart';
import './Providers/Products.dart';
import 'Providers/favorites.dart';
import 'account/SignIn.dart';

void main() {
  runApp(
      // البروفايدر يوفر كلاس المنتج في كامل التطبيق
      MultiProvider(
    providers: [
      ChangeNotifierProvider<Products>(
        create: (context) => Products(),
      ),
      ChangeNotifierProvider<CartProvider>(
        create: (c) => CartProvider(),
      ),
      ChangeNotifierProvider<FavProvider>(
        create: (c) => FavProvider(),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
        fontFamily: 'Lato',
      ),
      home: SignIn(),
    );
  }
}
