import 'package:brainjogging/screens/games/shapes.dart';
import 'package:brainjogging/main.dart';
import 'package:flutter/material.dart';

class Training extends StatelessWidget {
  const Training({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Training")),
        body: ListView(
          children: [
            ListTile(
              title: const Text("Headcalculation"),
              onTap: () => Navigator.of(context).pushNamed(HEADCALCULATION_ROUTE_NAME),
              tileColor: Colors.deepOrange,
            ),
            ListTile(
              title: const Text("Stroop"),
              onTap: () => Navigator.of(context).pushNamed(STROOP_ROUTE_NAME),
              tileColor: Colors.yellowAccent,
            ),
            ListTile(
              title: const Text("Remember"),
              onTap: () => Navigator.of(context).pushNamed(REMEMBER_ROUTE_NAME),
              tileColor: Colors.pinkAccent,
            ),
            ListTile(
              title: const Text("Shapes"),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Shapes())),
              tileColor: Colors.purpleAccent,
            ),
          ],
        ));
  }
}
