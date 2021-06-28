import 'package:flutter/material.dart';
import 'package:galaxy_shop_1/Providers/Products.dart';
import 'package:galaxy_shop_1/Providers/cart.dart';
import 'package:provider/provider.dart';

class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Cart(),
    );
  }
}

// كلاس السلة
class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  Widget buildCartItem(context, i) {
    final productsData = Provider.of<CartProvider>(context);
    final products = productsData.cartContent;
    return Container(
      height: 140.0,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            width: 120.0,
            child: Image.asset(products[i].imageUrl),
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Container(
                  width: 100,
                  child: Text(products[i].title),
                ),
                SizedBox(
                  width: 100,
                ),
                IconButton(
                  onPressed: () {
                    productsData.removeFromCart(products[i]);
                  },
                  icon: Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                  ),
                ),
              ]),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Text('Price : '),
                  Text('${products[i].price} \$'),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Text('Count : '),
                  Container(
                    width: 150,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            products[i].count--;
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 30,
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              products[i].count.toString(),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            products[i].count++;
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    final productsData = Provider.of<CartProvider>(context);
    final products = productsData.cartContent;
    double price = 0;
    products.forEach((element) {
      price += element.price;
    });
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Scaffold(
        appBar: AppBar(
          title: Text('product'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildCartItem(context, index),
                  separatorBuilder: (context, index) => Container(
                        height: 2,
                        width: double.infinity,
                        color: Colors.grey[300],
                      ),
                  itemCount: products.length),
              Container(
                padding: EdgeInsets.fromLTRB(50, 10, 20, 20),
                child: Row(
                  children: [
                    Text(
                      'Total price',
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text('\$' + price.toString()),
                    SizedBox(
                      width: 29,
                    ),
                    // ignore: deprecated_member_use
                    Builder(
                      builder: (context) => MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        onPressed: () {},
                        child: Text(
                          'Complete purchase',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
