import 'package:brainjogging/screens/games/headcalculation.dart';
import 'package:brainjogging/screens/games/rememeber.dart';
import 'package:brainjogging/screens/games/shapes.dart';
import 'package:brainjogging/screens/games/stroop.dart';
import 'package:brainjogging/widgets/cards/training_card.dart';
import 'package:flutter/material.dart';

class Training extends StatelessWidget {
  const Training({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Training")),
        body: Column(
          children: [
            TrainingCard(
                text: "Headcalculation",
                target: Headcalculation(),
                color: Colors.deepOrange),
            TrainingCard(
                text: "Stroop",
                target: const Stroop(),
                color: Colors.yellowAccent),
            TrainingCard(
                text: "Remember",
                target: const Remember(),
                color: Colors.pinkAccent),
            TrainingCard(
                text: "Shapes",
                target: const Shapes(),
                color: Colors.purpleAccent),
          ],
        ));
  }
}
