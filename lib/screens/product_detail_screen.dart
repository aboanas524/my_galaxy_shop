import 'dart:ui';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';
import 'package:galaxy_shop_1/Providers/Products.dart';
import 'package:provider/provider.dart';


class ProductDetailScreen extends StatefulWidget {

  final String id;
  final String title;
  final String imageUrl;
  final double price;
  bool isFavorite;
  final String description;
  ProductDetailScreen(this.id,this.title,this.imageUrl,this.price,this.isFavorite,this.description);
  @override
  _ProductDetailScreen createState() => _ProductDetailScreen();
}

class _ProductDetailScreen extends State<ProductDetailScreen> {
  //her
  var _myColorOne = Colors.grey;
  var _myColorTwo = Colors.grey;
  var _myColorThree = Colors.grey;
  var _myColorFour = Colors.grey;
  var _myColorFive = Colors.grey;

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    // ignore: unused_local_variable
    CarouselSlider carouselSlider;

    // ignore: unused_local_variable
    List imgList = [
      'images/card1.jpg',
      'images/card2.jpg',
      'images/card3.jog',
    ];
    // int _current = 0;
    //
    // List<T> map<T>(List imglist, Function handler) {
    //   List<T> result = [];
    //   for (var i = 0; i < imglist.length; i++) {
    //     result.add(handler(i, imglist[i]));
    //   }
    //   return result;
    // }

    Widget titleSection = Container(
      child: Expanded(
        child:
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(32.0),
                child: Row(
                  children: [
                    Text(widget.description,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      '      ${widget.price}\$',
                      style: TextStyle(
                        color: Colors.grey[1000],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    new IconButton(
                      icon: new Icon(Icons.star),
                      onPressed: () =>
                          setState(() {
                            _myColorOne = Colors.orange;
                            _myColorTwo = null;
                            _myColorThree = null;
                            _myColorFour = null;
                            _myColorFive = null;
                          }),
                      color: _myColorOne,
                    ),
                    new IconButton(
                      icon: new Icon(Icons.star),
                      onPressed: () =>
                          setState(() {
                            _myColorOne = Colors.orange;
                            _myColorTwo = Colors.orange;
                            _myColorThree = Colors.grey;
                            _myColorFour = Colors.grey;
                            _myColorFive = Colors.grey;
                          }),
                      color: _myColorTwo,
                    ),
                    new IconButton(
                      icon: new Icon(Icons.star),
                      onPressed: () =>
                          setState(() {
                            _myColorOne = Colors.orange;
                            _myColorTwo = Colors.orange;
                            _myColorThree = Colors.orange;
                            _myColorFour = Colors.grey;
                            _myColorFive = Colors.grey;
                          }),
                      color: _myColorThree,
                    ),
                    new IconButton(
                      icon: new Icon(Icons.star),
                      onPressed: () =>
                          setState(() {
                            _myColorOne = Colors.orange;
                            _myColorTwo = Colors.orange;
                            _myColorThree = Colors.orange;
                            _myColorFour = Colors.orange;
                            _myColorFive = Colors.grey;
                          }),
                      color: _myColorFour,
                    ),
                    new IconButton(
                      icon: new Icon(Icons.star),
                      onPressed: () =>
                          setState(() {
                            _myColorOne = Colors.orange;
                            _myColorTwo = Colors.orange;
                            _myColorThree = Colors.orange;
                            _myColorFour = Colors.orange;
                            _myColorFive = Colors.orange;
                          }),
                      color: _myColorFive,
                    ),
                  ],
                ),
              )
            ]
        ),
      ),
    );

    Widget buttonSection = Container(
      margin: EdgeInsets.all(6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildButtonColumn(
              Colors.cyan,
              IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
              'ADD TO CART'),
          _buildButtonColumn(
              Colors.cyan,
              IconButton(icon: Icon(Icons.comment), onPressed: () {}),
              'COMMENT'),
          _buildButtonColumn(Colors.cyan,
              IconButton(icon: Icon(Icons.favorite),
                  color: widget.isFavorite ? Colors.red : Colors.grey,
                  onPressed: () {
                    setState(() {
                      widget.isFavorite?widget.isFavorite=false:widget.isFavorite=true;

                    });
                    for(int i=0;i<productsData.items.length;i++)
                    {
                      if(productsData.items[i].id==widget.id)
                      {
                        productsData.items[i].isFavorite=widget.isFavorite;
                      }
                    }
                  }), 'LIKE'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        'bla bla bla bla bla bla bla bla bka bkdbkjbker iueegkge yvdm hyd diyjhw hjag uuuhedj  ',
        softWrap: true,
        style: TextStyle(fontSize: 20.0),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Scaffold(
        appBar: AppBar(
            title: Text(widget.title),
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
                      image: AssetImage(widget.imageUrl),
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
                      image: AssetImage(widget.imageUrl),
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
                      image: AssetImage(widget.imageUrl),
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
        IconButton(icon: iconButton, color: color, onPressed: () {}),
        Container(
          margin: const EdgeInsets.fromLTRB(30.0, 8.0, 16.0, 0.0),
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
