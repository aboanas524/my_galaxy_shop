
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galaxy_shop_1/screens/product_overview_screen.dart';
import 'package:provider/provider.dart';
import './Providers/Products.dart';
import 'account/SignIn.dart';
void main() {
  runApp(
    // البروفايدر يوفر كلاس المنتج في كامل التطبيق
      MultiProvider(
        providers: [
          ChangeNotifierProvider<Products>(
            create: (context) => Products(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ProductsOverviewScreen(0),
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




