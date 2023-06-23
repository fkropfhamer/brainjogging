import 'package:brainjogging/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'brainjogging',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: Home());
  }
}
