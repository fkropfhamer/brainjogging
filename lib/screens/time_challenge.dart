import 'package:brainjogging/widgets/games/game_widget.dart';
import 'package:brainjogging/widgets/games/stroop.dart';
import 'package:brainjogging/widgets/games/tap.dart';
import 'package:flutter/material.dart';

final tasksPerGame = 5;

class TimeChallenge extends StatefulWidget {
  const TimeChallenge({Key? key}) : super(key: key);

  @override
  State<TimeChallenge> createState() => _TimeChallengeState();
}

class _TimeChallengeState extends State<TimeChallenge> {
  var isStarted = false;
  var isFinished = false;
  var time = Duration();
  var cIndex = 0;
  final _stopwatch = Stopwatch();
  late final _games = [
    Stroop(setScore: _setScore, finished: _next),
    Tap(setScore: _setScore, finished: _next, numTasks: tasksPerGame)
  ];

  void _start() {
    setState(() {
      isStarted = true;
      _stopwatch.start();
    });
  }

  void _stop() {
    _stopwatch.reset();
    setState(() {
      cIndex = 0;
      isStarted = false;
      isFinished = false;
    });
  }

  void _setScore(score) {
    setState(() {});
  }

  void _next() {
    final i = cIndex + 1;
    if (i >= _games.length) {
      _finished();

      return;
    }

    setState(() {
      cIndex = i;
    });
  }

  void _finished() {
    setState(() {
      isFinished = true;
      time = _stopwatch.elapsed;
    });
  }

  GameWidget _getGame(int i) {
    return _games[i];
  }

  @override
  Widget build(BuildContext context) {
    if (isFinished) {
      return Scaffold(
          appBar: AppBar(title: const Text("Result")),
          body: ListView(
            children: [
              Text("Result $time"),
              ElevatedButton(
                  onPressed: () {
                    _stop();
                  },
                  child: const Text("Exit"))
            ],
          ));
    }

    if (isStarted) {
      return Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _getGame(cIndex),
          ElevatedButton(
            onPressed: _stop,
            child: const Text("Stop"),
          ),
          ElevatedButton(
            onPressed: _next,
            child: const Text("next"),
          ),
        ],
      ));
    }

    return StatsWidget(
      onStart: _start,
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
        appBar: AppBar(title: const Text("Time Challenge")),
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
