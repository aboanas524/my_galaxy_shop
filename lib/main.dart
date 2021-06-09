
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galaxy_shop_1/screens/product_overview_screen.dart';
import './screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import './Providers/Products.dart';
import 'account/SignIn.dart';
void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<Products>(
            create: (context) => Products(),
          )
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
        primarySwatch: Colors.cyan,
        accentColor: Colors.lightBlueAccent,
        fontFamily: 'Lato',
      ),
      home: SignIn(),
      // routes: {ProductDetailScreen.routName: (ctx) => ProductDetailScreen(),
      // },
    );
  }
}




