import 'package:brainjogging/widgets/games/game_widget.dart';
import 'package:flutter/material.dart';

class Tap extends GameWidget {
  Tap({super.key, required super.setScore, required Function() super.finished, numTasks})
      : super(numTasks: numTasks);

  @override
  State<Tap> createState() => _TapState();
}

class _TapState extends State<Tap> {
  var _score = 0;

  void tap() {
    final newScore = _score + 1;
    if (widget.numTasks != null && newScore > widget.numTasks!) {
      widget.finished();

      return;
    }

    setState(() {
      _score = newScore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text("Tap"),
        TextButton(
          onPressed: tap,
          child: Text("$_score"),
        )
      ]),
    );
  }
}
