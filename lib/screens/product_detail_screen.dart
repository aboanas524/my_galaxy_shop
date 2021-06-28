import 'dart:ui';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';
import 'package:galaxy_shop_1/Providers/Products.dart';
import 'package:galaxy_shop_1/Providers/cart.dart';
import 'package:galaxy_shop_1/Providers/favorites.dart';
import 'package:galaxy_shop_1/models/product.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  ProductDetailScreen(
    this.product,
  );
  @override
  _ProductDetailScreen createState() => _ProductDetailScreen();
}

class _ProductDetailScreen extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var fav = Provider.of<FavProvider>(context);
    var cart = Provider.of<CartProvider>(context);
    // ignore: unused_local_variable
    CarouselSlider carouselSlider;

    // ignore: unused_local_variable
    List imgList = [
      'images/card1.jpg',
      'images/card2.jpg',
      'images/card3.jog',
    ];
    Widget titleSection = Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.all(32.0),
          child: Row(
            children: [
              Text(
                widget.product.title,
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(
                width: 20.0,
              ),
              Text(
                '      ${widget.product.price}\$',
                style: TextStyle(
                  color: Colors.grey[1000],
                ),
              ),
            ],
          ),
        ),
      ]),
    );

    Widget buttonSection = Container(
      margin: EdgeInsets.all(6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildButtonColumn(
              Colors.cyan,
              IconButton(
                  icon: Icon(cart.cartContent.contains(widget.product)
                      ? Icons.done
                      : Icons.shopping_cart),
                  onPressed: () {
                    if (cart.cartContent.contains(widget.product))
                      cart.removeFromCart(widget.product);
                    else
                      cart.addToCart(widget.product);
                    setState(() {});
                  }),
              'ADD TO CART'),
          _buildButtonColumn(
              Colors.cyan,
              IconButton(
                  icon: Icon(Icons.favorite),
                  color: fav.favContent.contains(widget.product)
                      ? Colors.red
                      : Colors.grey,
                  onPressed: () {
                    if (fav.favContent.contains(widget.product))
                      fav.removeFromFav(widget.product);
                    else
                      fav.addToFav(widget.product);
                    setState(() {});
                  }),
              'LIKE'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        widget.product.description,
        softWrap: true,
        style: TextStyle(fontSize: 20.0),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Product'),
          backgroundColor: Colors.cyan,
        ),
        body: ListView(
          children: <Widget>[
            carouselSlider = CarouselSlider(
              items: [
                //1st Im
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(widget.product.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //4th Image of Slider
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(widget.product.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                //5th Image of Slider
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(widget.product.imageUrl),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
              //Slider Container properties
              options: CarouselOptions(
                height: 220.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconButton iconButton, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        iconButton,
        Container(
          margin: const EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 0.0),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
