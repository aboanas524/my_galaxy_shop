import 'package:flutter/material.dart';

class cart_item {
  String name;
  int amount;
  // ignore: non_constant_identifier_names
  Image item_image;
  double price;
  cart_item() {
    this.amount;
    this.item_image;
    this.name;
    this.price;
  }
}

class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Cart(),
    );
  }
}

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int count = 1;

  Widget buildCartItem() =>
      Container(
        height: 140.0,
        child: Row(
          children: [
            Container(
              width: 150.0,
              child: Image.asset('images/card2.jpg'),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                    children: [
                      Text('phone'),
                      SizedBox(
                        width: 120,
                      ),
                      IconButton(
                        onPressed: () {},
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
                    Text('\$800'),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                    children: [
                      Text('Count : '),
                      Container(
                      width: 131,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (count > 1) {
                                  count--;
                                }
                              });
                            },
                            icon: Icon(Icons.remove, color: Colors.white,size: 20,),),
                          Container(
                            width: 30,
                            height: 30,
                            color: Colors.white,
                            child: Center(
                              child: Text('${count.toString()}',
                                style: TextStyle(color: Colors.black,fontSize: 20),),
                            ),
                          ),
                          IconButton(onPressed: () {
                            setState(() {
                              count++;
                            });
                          }, icon: Icon(Icons.add, color: Colors.white,size: 20,),),
                          SizedBox(
                            width: 5.0,
                          ),

                        ],
                      ),
                    ),
                    ]
                )
              ],
            ),
          ],
        ),
      );

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Scaffold(
        appBar: AppBar(
          title: Text('prodact'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              buildCartItem(),
              Container(
                child: SizedBox(
                  height: 1.0,
                  width: double.infinity,
                ),
                color: Colors.grey[600],
              ),
              buildCartItem(),
              Container(
                child: SizedBox(
                  height: 1.0,
                  width: double.infinity,
                ),
                color: Colors.grey[600],
              ),
              buildCartItem(),
              Container(
                child: SizedBox(
                  height: 1.0,
                  width: double.infinity,
                ),
                color: Colors.grey[600],
              ),
              buildCartItem(),
              Container(
                child: SizedBox(
                  height: 1.0,
                  width: double.infinity,
                ),
                color: Colors.grey[600],
              ),
              buildCartItem(),
              Container(
                child: SizedBox(
                  height: 1.0,
                  width: double.infinity,
                ),
                color: Colors.grey[600],
              ),
              buildCartItem(),
              Container(
                child: SizedBox(
                  height: 1.0,
                  width: double.infinity,
                ),
                color: Colors.grey[600],
              ),
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
                    Text('\$5000'),
                    SizedBox(
                      width: 29,
                    ),
                    // ignore: deprecated_member_use
                    Builder(
                      builder: (context) =>
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            onPressed: () {},
                            child: Text(
                              'Complate purchase',
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
