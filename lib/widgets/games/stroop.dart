import 'package:brainjogging/widgets/games/game_widget.dart';
import 'package:flutter/material.dart';

class Stroop extends GameWidget {
  Stroop({required Function(int score) setScore, required Function() finished, numTasks})
      : super(setScore: setScore, finished: finished, numTasks: numTasks);

  @override
  State<Stroop> createState() => _StroopState();
}

class _StroopState extends State<Stroop> {
  var _score = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text("stroop"),
        TextButton(
          child: Text("$_score"),
          onPressed: () => {widget.finished()},
        )
      ]),
    );
  }
}
