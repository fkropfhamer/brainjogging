import 'package:flutter/material.dart';

class NumberKeyboard extends StatefulWidget {
  const NumberKeyboard({super.key});

  @override
  State<NumberKeyboard> createState() => _NumberKeyboardState();
}

class _NumberKeyboardState extends State<NumberKeyboard> {
  String _number = "";

  void addNumber(int number) {
    setState(() {
      _number += "$number";
    });
  }

  void remove() {
    if (_number.length > 0)
    setState(() {
      _number = _number.substring(0, _number.length - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Column( children: [
        Text(_number),
      Row(
        children: [
          ElevatedButton(onPressed: () { remove(); }, child: const Text("back")),
          ElevatedButton(onPressed: () {}, child: const Text("submit"))
        ],
      ),
      GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      children: [
        NumberButton(setNumber: this.addNumber, number: 1),
        NumberButton(setNumber: this.addNumber, number: 2),
        NumberButton(setNumber: this.addNumber, number: 3),
        NumberButton(setNumber: this.addNumber, number: 4),
        NumberButton(setNumber: this.addNumber, number: 5),
        NumberButton(setNumber: this.addNumber, number: 6),
        NumberButton(setNumber: this.addNumber, number: 7),
        NumberButton(setNumber: this.addNumber, number: 8),
        NumberButton(setNumber: this.addNumber, number: 9),
    ])],);
  }
}

class NumberButton extends StatelessWidget {
  const NumberButton({super.key, required this.number, required this.setNumber});

  final int number;
  final Function(int number) setNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(onPressed: () { this.setNumber(number); }, child: Text("$number")),
    );
  }
}

