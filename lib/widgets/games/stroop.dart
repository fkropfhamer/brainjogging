import 'package:brainjogging/widgets/games/game_widget.dart';
import 'package:flutter/material.dart';

class Stroop extends GameWidget {
  Stroop({
    super.key,
    required super.setScore,
    required Function() super.finished,
    numTasks,
  }) : super(numTasks: numTasks);

  @override
  State<Stroop> createState() => _StroopState();
}

class _StroopState extends State<Stroop> {
  final _score = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("stroop"),
          TextButton(
            child: Text("$_score"),
            onPressed: () => {widget.finished()},
          ),
        ],
      ),
    );
  }
}
