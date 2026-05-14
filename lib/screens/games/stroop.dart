import 'dart:math';

import 'package:flutter/material.dart';

class Stroop extends StatefulWidget {
  const Stroop({super.key});

  @override
  StroopState createState() => StroopState();
}

var colors = {
  'Red': Colors.red.shade700,
  'Green': Colors.green,
  'Blue': Colors.blue,
  'Yellow': Colors.yellow,
  'Purple': Colors.deepPurple,
  'Orange': Colors.orange,
  'Brown': Colors.brown,
  'Pink': Colors.pink.shade300,
  'Black': Colors.black,
};

class StroopState extends State<Stroop> {
  late Color _color;
  late String _colorText;
  final _random = Random();
  var _score = 0;

  final _colorTexts = colors.keys.toList();
  final _colors = colors.values.toList();

  StroopState() {
    _generateTask();
  }

  void _generateTask() {
    _generateColor();
    _colorTexts.shuffle();
    _colors.shuffle();
  }

  void _generateColor() {
    _colorText = colors.keys.elementAt(_random.nextInt(colors.length));
    _color = colors.values.elementAt(_random.nextInt(colors.length));
  }

  void _checkResult(String color) {
    var inputColor = colors[color];

    if (inputColor == _color) {
      _score++;
      _generateTask();
    } else {
      _score--;
    }

    setState(() {});
  }

  Widget _generateButtonRow(int index) {
    List<Widget> buttons = [];

    for (var i = 0; i < 3; i++) {
      var totalIndex = index * 3 + i;
      var colorText = _colorTexts[totalIndex];

      var button = ElevatedButton(
        onPressed: () => {_checkResult(colorText)},
        style: ElevatedButton.styleFrom(backgroundColor: _colors[totalIndex]),
        child: Text(colorText),
      );
      buttons.add(button);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: buttons,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stroop")),
      body: Column(
        children: [
          Center(
            child: Text(
              _colorText,
              style: TextStyle(fontSize: 100, color: _color),
            ),
          ),
          _generateButtonRow(0),
          _generateButtonRow(1),
          _generateButtonRow(2),
          Center(
            child: Text('Score: $_score', style: const TextStyle(fontSize: 30)),
          ),
        ],
      ),
    );
  }
}
