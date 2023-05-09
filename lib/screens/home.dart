import 'package:brainjogging/main.dart';
import 'package:brainjogging/screens/settings.dart';
import 'package:brainjogging/widgets/cards/home_card.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          actions: [
            IconButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings())),
                icon: const Icon(Icons.settings))
          ],
        ),
        body: Column(
          children: [
            HomeCard(text: "Training", routeName: TRAINING_ROUTE_NAME),
            HomeCard(
              text: "Time Training",
              routeName: TIME_TRAINING_ROUTE_NAME,
            ),
            HomeCard(
              text: "Random Challenge",
              routeName: RANDOM_CHALLENGE_ROUTE_NAME,
            ),
            HomeCard(
              text: "Challenge",
              routeName: CHALLENGE_ROUTE_NAME,
            ),
          ],
        ));
  }
}
