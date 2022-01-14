import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: ListView(
        children: [
          ListTile(title: const Text("Headcalculation"), onTap: () => Navigator.of(context).pushNamed('/headcalculation'), tileColor: Colors.deepOrange,),
          ListTile(title: const Text("Stroop"), onTap: () => Navigator.of(context).pushNamed('/stroop'), tileColor: Colors.yellowAccent,),
          ListTile(title: const Text("Remember"), onTap: () => Navigator.of(context).pushNamed('/remember'), tileColor: Colors.pinkAccent,),
          ListTile(title: const Text("About"), onTap: () => Navigator.of(context).pushNamed('/about'), tileColor: Colors.blue,),
        ],
      )
    );
  }
}
