import 'dart:math';

import 'package:flutter/material.dart';

class Stroop extends StatefulWidget {
  const Stroop({ Key? key }) : super(key: key);

  @override
  _StroopState createState() => _StroopState();
} 

const colors = {
  'Red': Colors.red,
  'Green': Colors.green,
  'Blue': Colors.blue,
  'Yellow': Colors.yellow,
  'Purple': Colors.purple,
  'Orange': Colors.orange,
  'Brown': Colors.brown,
  'Pink': Colors.pink,
  'Black': Colors.black,
};

class _StroopState extends State<Stroop> {
  var _color;
  var _colorText;
  var _random = new Random();
  var _score = 0;

  var _colorTexts = colors.keys;
  var _colors = colors.values;

  _StroopState() {
    generateColor();
  }

  generateColor() {
    _colorText = colors.keys.elementAt(_random.nextInt(colors.length));
    _color = colors.values.elementAt(_random.nextInt(colors.length));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stroop"),),
      body: Column(
       children: [
          const Text("data"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            ElevatedButton(child: Text("data"), onPressed: () => {},),
            ElevatedButton(child: Text("data"), onPressed: () => {},),
            ElevatedButton(child: Text("data"), onPressed: () => {},)
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            ElevatedButton(child: Text("data"), onPressed: () => {},),
            ElevatedButton(child: Text("data"), onPressed: () => {},),
            ElevatedButton(child: Text("data"), onPressed: () => {},)
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            ElevatedButton(child: Text("data"), onPressed: () => {},),
            ElevatedButton(child: Text("data"), onPressed: () => {},),
            ElevatedButton(child: Text("data"), onPressed: () => {},)
          ],)
        ],
      ),
    );
  }
}