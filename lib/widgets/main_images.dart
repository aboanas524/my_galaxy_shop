import 'package:flutter/material.dart';

class mainImages extends StatelessWidget {
  const mainImages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(image: AssetImage("images/card12.jpg")),
        Text("haha"),
      ],
    );
  }
}
