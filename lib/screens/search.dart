import 'package:flutter/material.dart';

class PageSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          //  حقل البحث  بدون معالجات
          flexibleSpace:TextFormField(
            autofocus: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Search',
              suffixIcon: Icon(Icons.search),
            ),
            maxLines: 1,
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // تحديد مجال السعر في الفلترة
                  padding: EdgeInsets.fromLTRB(24, 10, 20, 10),
                  child: Text(
                    'Price:',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
                      child: Text('min:'),
                    ),
                    SizedBox(
                      width: 75.0,
                    ),
                    Container(
                      width: 100.0,
                      // ادخال اصغر قيمة للفلترة عليها يوجد ايضا max
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'min',
                            prefixText: '\$',
                            suffixText: 'USD',
                            suffixStyle: TextStyle(color: Colors.green)),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
                      child: Text('max:'),
                    ),
                    SizedBox(
                      width: 71.0,
                    ),
                    Container(
                      width: 100.0,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'max',
                            prefixText: '\$',
                            suffixText: 'USD',
                            suffixStyle: TextStyle(color: Colors.green)),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 30.0,
              width: double.infinity,
              child:
              // ignore: deprecated_member_use
              RaisedButton(
                  child: Text('Filter'),
                  color: Colors.cyan,
                  onPressed: () {}),
            ),
            SizedBox(
              height: 25.0,
            ),
            //here we need grid view
            buildItem(),
          ],
        ),
      ),
    );
  }
  // ظهور المنتج بعد الفلترة
  Widget buildItem() => Container(
    padding: EdgeInsets.fromLTRB(24, 10, 20, 10),
    child: Column(
      children: [
        Image.asset('images/card3.jpg'),
        SizedBox(height: 8.0),
        Row(
          children: [
            Text(
              'name',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
        SizedBox(height: 4.0),
        Row(
          children: [
            Text(
              '1200\$',
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
              'blabalblablbaballbablablabladd',
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
              onPressed: () {},
              child: Text('Add To Cart'),
              color: Colors.cyan,
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
