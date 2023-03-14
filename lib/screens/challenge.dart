import 'package:brainjogging/widgets/games/gameWidget.dart';
import 'package:brainjogging/widgets/games/stroop.dart';
import 'package:brainjogging/widgets/games/tap.dart';
import 'package:flutter/material.dart';

class Challenge extends StatefulWidget {
  const Challenge({Key? key}) : super(key: key);

  @override
  State<Challenge> createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge> {
  var isStarted = false;
  var cIndex = 0;

  void _setScore(score) {
    setState(() {});
  }

  void _next() {
    cIndex += 1;
  }

  GameWidget _getGame(int i) {
    if (i == 0) {
      return Tap(
        setScore: _setScore,
        finished: _next,
      );
    }

    return Stroop(
      setScore: _setScore,
      finished: _next,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isStarted) {
      return Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _getGame(cIndex),
          ElevatedButton(
            onPressed: () {
              setState(() {
                isStarted = false;
              });
            },
            child: const Text("Stop"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                cIndex += 1;
              });
            },
            child: const Text("next"),
          ),
        ],
      ));
    }

    return StatsWidget(
      onStart: () {
        setState(() {
          isStarted = true;
        });
      },
    );
  }
}

class StatsWidget extends StatefulWidget {
  const StatsWidget({Key? key, required this.onStart}) : super(key: key);

  final VoidCallback onStart;

  @override
  State<StatsWidget> createState() => _StatsWidgetState();
}

class _StatsWidgetState extends State<StatsWidget> {
  final highScore = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Challenge")),
        body: ListView(
          children: [
            Text("Highscore: $highScore"),
            ElevatedButton(
                onPressed: () {
                  widget.onStart();
                },
                child: const Text("Start"))
          ],
        ));
  }
}
