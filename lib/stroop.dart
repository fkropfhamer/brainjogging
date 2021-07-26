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
  'Blue': Colors.blue
};

class _StroopState extends State<Stroop> {
  var _color;
  var _colorText;
  var _random = new Random();

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
      body: ListView(
        children: [
          ListTile(title: Text(_colorText, style: TextStyle(color: _color),),)
        ],
      ),
    );
  }
}