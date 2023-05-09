import 'package:brainjogging/widgets/games/game_widget.dart';
import 'package:flutter/material.dart';

class Training<T extends GameWidget> extends StatefulWidget {
  const Training({Key? key, required this.title, required this.createGame})
      : super(key: key);

  final String title;
  final T Function(Function(int x)) createGame;

  @override
  State<Training> createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  var _score = 0;

  void _setScore(int score) {
    setState(() {
      _score = score;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            widget.createGame(_setScore),
            ListTile(
              title: Text('Score: $_score'),
            )
          ],
        ));
  }
}
