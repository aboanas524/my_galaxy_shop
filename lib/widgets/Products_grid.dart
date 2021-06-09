
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:galaxy_shop_1/Providers/Products.dart';
import 'package:galaxy_shop_1/screens/product_detail_screen.dart';
import 'package:galaxy_shop_1/screens/search.dart';
import '../widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        actions: [
          Padding(child: IconButton(icon:Icon(Icons.search),onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return PageSearch();
            }));
          },),
          padding: EdgeInsets.only(right: 10),),
        ],
        title: Text('Galaxy Market'),
      ),
      body: ListView(
        children: [
          CarouselSlider(
            items: [
              Container(
                width: double.infinity,
                child: Image(fit: BoxFit.fitWidth,
                    image: AssetImage("images/food2.jpg")),
              ),

              Container(
                width: double.infinity,
                child: Image(fit: BoxFit.fitWidth,
                    image: AssetImage("images/card7.jpg")),
              ),

              Container(
                width: double.infinity,
                child: Image(fit: BoxFit.fitWidth,
                    image: AssetImage("images/card8.jpg")),
              ),
              Container(
                width: double.infinity,
                child: Image(fit: BoxFit.fitWidth,
                    image: AssetImage("images/card9.jpg")),
              ),

              Container(
                width: double.infinity,
                child: Image(fit: BoxFit.fitWidth,
                    image: AssetImage("images/card10.jpg")),
              ),
            ],
            options: CarouselOptions(
              height: 275.0,
              autoPlay: true,
              aspectRatio: 2,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 1,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          MyItem(),
        ],
      ),
    );
  }
}
class MyItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return Consumer<Products>(
      builder: (context, provider, child) =>
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, i) =>
                ProductItem(
                  products[i].id,
                  products[i].title,
                  products[i].imageUrl,
                  products[i].price,
                  products[i].isFavorite,
                  products[i].description,
                ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 175,
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2
            ),
          ),
    );
  }
}