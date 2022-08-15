import 'package:brainjogging/main.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.settings))],
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

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key, required this.text, required this.routeName})
      : super(key: key);

  final String text;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Card(
      child: InkWell(
          splashColor: Colors.blue.withAlpha(40),
          onTap: () => Navigator.of(context).pushNamed(this.routeName),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(this.text)],
          )),
    ));
  }
}
