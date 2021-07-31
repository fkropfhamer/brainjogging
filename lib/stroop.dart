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

  var _colorTexts = colors.keys.toList();
  var _colors = colors.values.toList();

  _StroopState() {
    generateTask();
  }

  generateTask() {
    generateColor();
    _colorTexts.shuffle();
    _colors.shuffle();
  }

  generateColor() {
    _colorText = colors.keys.elementAt(_random.nextInt(colors.length));
    _color = colors.values.elementAt(_random.nextInt(colors.length));
  }
  
  checkResult(String color) {
    var inputColor = colors[color];

    if (inputColor == _color) {
      _score++;
      generateTask();
    } else {
      _score--;
    }

    setState(() {});
  }
  // color -> text

  Widget _generateButtonRow(int index) {
    List<Widget> buttons = [];

    for (var i = 0; i < 3; i++) {
      var totalIndex = index*3 + i;
      var colorText = _colorTexts[totalIndex];

      var button = ElevatedButton(child: Text(colorText), onPressed: () => { checkResult(colorText)}, style: ElevatedButton.styleFrom(primary: _colors[totalIndex]),);
      buttons.add(button);
    }

    return Row(children: buttons, mainAxisAlignment: MainAxisAlignment.spaceAround);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stroop"),),
      body: Column(
       children: [
          Center( child: Text(_colorText, style: TextStyle(fontSize: 30, color: _color )) ),
          _generateButtonRow(0),
          _generateButtonRow(1),
          _generateButtonRow(2),
          Center( child: Text('Score: $_score', style: const TextStyle(fontSize: 30)) ),
        ],
      ),
    );
  }
}