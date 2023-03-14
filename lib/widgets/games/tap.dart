import 'package:brainjogging/widgets/games/gameWidget.dart';
import 'package:flutter/material.dart';

class Tap extends GameWidget {
  Tap({required Function(int score) setScore, required Function() finished})
      : super(setScore: setScore, finished: finished);

  @override
  State<Tap> createState() => _TapState();
}

class _TapState extends State<Tap> {
  var _score = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text("Tap"),
        TextButton(
          child: Text("$_score"),
          onPressed: () => {
            setState(
              () {
                _score += 1;
              },
            )
          },
        )
      ]),
    );
  }
}
