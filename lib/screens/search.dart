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
  _Myapp createState() => _Myapp();
}

class _Myapp extends State<MyApp> {
  String _group1SelectedValue;
  String _group2SelectedValue;
  var _myColorOne = Colors.grey;
  var _myColorTwo = Colors.grey;
  var _myColorThree = Colors.grey;
  var _myColorFour = Colors.grey;
  var _myColorFive = Colors.grey;


  @override
  void initState() {
    _group1SelectedValue = "";
    _group2SelectedValue = "";

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView(
        shrinkWrap: true,
        children:[
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
            ),
            maxLines: 1,
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(24, 10, 20, 10),
            child: RichText(
              text: TextSpan(
                text: "Brands: ",
                style: TextStyle(fontSize: 20.0,color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: '$_group1SelectedValue ',
                      style: TextStyle(fontSize: 18,color: Colors.black)),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text("Samsung"),
            leading: Radio(
                value: "Samsung",
                groupValue: _group1SelectedValue,
                onChanged: _group1Changes),
          ),
          ListTile(
            title: Text("Apple"),
            leading: Radio(
                value: "Apple",
                groupValue: _group1SelectedValue,
                onChanged: _group1Changes),
          ),
          ListTile(
            title: Text("Sony"),
            leading: Radio(
                value: "Sony",
                groupValue: _group1SelectedValue,
                onChanged: _group1Changes),
          ),
          ListTile(
            title: Text("Another Brand"),
            leading: Radio(
                value: "Another Brand",
                groupValue: _group1SelectedValue,
                onChanged: _group1Changes),
          ),
          Container(
            height: 1.0,
            width: double.infinity,
            color: Colors.cyan[700],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(24, 10, 20, 10),
            child: RichText(
              text: TextSpan(
                text: "Choose type: ",
                style: TextStyle(fontSize: 20.0,color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: '$_group2SelectedValue ',
                      style: TextStyle(fontSize: 18,color: Colors.black)),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text("TV"),
            leading: Radio(
                value: "TV",
                groupValue: _group2SelectedValue,
                onChanged: _group2Changes,
            ),
          ),
          ListTile(
            title: Text("LapTop"),
            leading: Radio(
                value: "LapTop",
                groupValue: _group2SelectedValue,
                onChanged: _group2Changes),
          ),
          ListTile(
            title: Text("Mobile"),
            leading: Radio(
                value: "Mobile",
                groupValue: _group2SelectedValue,
                onChanged: _group2Changes),
          ),
          Container(
            height: 1.0,
            width: double.infinity,
            color: Colors.cyan[700],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
                    child: Text('Fillter'),
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
    );
  }
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

  void _group1Changes(String value) {
    setState(() {
      _group1SelectedValue = value;
    });
  }

  void _group2Changes(String value) {
    setState(() {
      _group2SelectedValue = value;
    });
  }
}
