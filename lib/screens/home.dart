import 'package:brainjogging/screens/random_challenge.dart';
import 'package:brainjogging/screens/settings.dart';
import 'package:brainjogging/screens/time_challenge.dart';
import 'package:brainjogging/screens/time_training.dart';
import 'package:brainjogging/screens/training_list.dart';
import 'package:brainjogging/widgets/cards/home_card.dart';
import 'package:flutter/material.dart';

import 'timed_challenge.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          actions: [
            IconButton(
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Settings())),
                icon: const Icon(Icons.settings))
          ],
        ),
        body: Column(
          children: [
            HomeCard(
                text: "Training",
                target: TrainingList()),
            HomeCard(
              text: "Time Training",
              target: TimeTraining(),
            ),
            HomeCard(
              text: "Random Challenge",
              target: RandomChallenge(),
            ),
            HomeCard(
              text: "Challenge",
              target: TimedChallenge(),
            ),
            HomeCard(
              text: "Time Challenge",
              target: TimeChallenge(),
            )
          ],
        ));
  }
}
