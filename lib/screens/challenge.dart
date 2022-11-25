import 'package:flutter/material.dart';

class Challenge extends StatefulWidget {
  const Challenge({Key? key}) : super(key: key);

  @override
  State<Challenge> createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge> {
  var isStarted = false;

  @override
  Widget build(BuildContext context) {
    if (isStarted) {
      return Container(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              isStarted = false;
            });
          },
          child: const Text("Stop"),
        ),
      );
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
