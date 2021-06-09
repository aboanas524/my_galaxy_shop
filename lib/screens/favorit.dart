
import 'package:flutter/material.dart';

class MyApp4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: favorit(),
    );
  }
}

class favorit extends StatefulWidget {
  @override
  _favoritState createState() => _favoritState();
}

class _favoritState extends State<favorit> {
  var _myColorOne = Colors.grey;

  var _myColorTwo = Colors.grey;

  var _myColorThree = Colors.grey;

  var _myColorFour = Colors.grey;

  var _myColorFive = Colors.grey;

  Widget builditem() => Container(
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
            Row(
              children: <Widget>[
                new IconButton(
                  icon: new Icon(Icons.star),
                  onPressed: () => setState(() {
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
                  onPressed: () => setState(() {
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
                  onPressed: () => setState(() {
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
                  onPressed: () => setState(() {
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
                  onPressed: () => setState(() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my favorit item'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => builditem(),
          separatorBuilder: (context, index) => SizedBox(
                height: 20.0,
              ),
          itemCount: 10),
    );
  }
}
