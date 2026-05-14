import 'package:flutter/material.dart';

class NumberKeyboard extends StatefulWidget {
  const NumberKeyboard({super.key, this.onChange, this.onSubmit});

  final Function(String number)? onChange;
  final Function(String number)? onSubmit;

  @override
  State<NumberKeyboard> createState() => _NumberKeyboardState();
}

class _NumberKeyboardState extends State<NumberKeyboard> {
  String _number = "";

  void setNumber(String number) {
    setState(() {
      _number = number;
    });

    if (widget.onChange != null) {
      widget.onChange!(number);
    }
  }

  void addNumber(int number) {
    setNumber("$_number$number");
  }

  void remove() {
    if (_number.isNotEmpty) {
      setNumber(_number.substring(0, _number.length - 1));
    }
  }

  void submit() {
    if (widget.onSubmit != null) {
      widget.onSubmit!(_number);
    }

    setNumber("");
  }

  @override
  Widget build(BuildContext context) {
    return
      GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      children: [
        NumberButton(setNumber: addNumber, number: 1),
        NumberButton(setNumber: addNumber, number: 2),
        NumberButton(setNumber: addNumber, number: 3),
        NumberButton(setNumber: addNumber, number: 4),
        NumberButton(setNumber: addNumber, number: 5),
        NumberButton(setNumber: addNumber, number: 6),
        NumberButton(setNumber: addNumber, number: 7),
        NumberButton(setNumber: addNumber, number: 8),
        NumberButton(setNumber: addNumber, number: 9),
        ElevatedButton(onPressed: () { remove(); }, child: const Text("back")),
        NumberButton(setNumber: addNumber, number: 0),
        ElevatedButton(onPressed: () { submit(); }, child: const Text("submit"))
    ]);
  }
}

class NumberButton extends StatelessWidget {
  const NumberButton({super.key, required this.number, required this.setNumber});

  final int number;
  final Function(int number) setNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(onPressed: () { setNumber(number); }, child: Text("$number")),
    );
  }
}

