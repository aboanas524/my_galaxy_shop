import 'package:flutter/material.dart';
import 'package:galaxy_shop_1/Providers/Products.dart';
import 'package:galaxy_shop_1/Providers/cart.dart';
import 'package:galaxy_shop_1/Providers/favorites.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Favorite(),
    );
  }
}

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  Widget buildItem(context, i) {
    final productsData = Provider.of<FavProvider>(context);
    final products = productsData.favContent;
    return Container(
      padding: EdgeInsets.fromLTRB(24, 10, 20, 10),
      child: Column(
        children: [
          Image.network(products[i].imageUrl),
          SizedBox(height: 8.0),
          Row(
            children: [
              Text(
                '${products[i].title}',
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
          SizedBox(height: 4.0),
          Row(
            children: [
              Text(
                '${products[i].price}\$',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.grey[1000],
                ),
              ),
            ],
          ),
          SizedBox(height: 4.0),
          Row(
            children: [
              Text(
                '${products[i].description}',
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          SizedBox(
            height: 4.0,
          ),
          Row(
            children: [
              // ignore: deprecated_member_use
              RaisedButton(
                onPressed: () {
                  Provider.of<CartProvider>(context).addToCart(products[i]);
                },
                child: Text('Add To Cart'),
                color: Colors.blue,
              ),
              SizedBox(
                width: 4.0,
              ),
// ignore: deprecated_member_use
              RaisedButton(
                onPressed: () {},
                child: Text('Info'),
                color: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<FavProvider>(context);
    final products = productsData.favContent;
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => buildItem(context, index),
          separatorBuilder: (context, index) => Container(
                height: 2,
                width: double.infinity,
                color: Colors.grey[300],
              ),
          itemCount: products.length),
    );
  }
}
