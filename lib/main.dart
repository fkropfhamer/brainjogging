import 'package:brainjogging/screens/timed_challenge.dart';
import 'package:brainjogging/screens/home.dart';
import 'package:brainjogging/screens/random_challenge.dart';
import 'package:brainjogging/screens/games/rememeber.dart';
import 'package:brainjogging/screens/games/stroop.dart';
import 'package:brainjogging/screens/time_training.dart';
import 'package:brainjogging/screens/training_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'brainjogging',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepPurple,
      ),
      home: Home(),
      routes: <String, WidgetBuilder>{
        TRAINING_ROUTE_NAME: (BuildContext context) => TrainingList(),
        STROOP_ROUTE_NAME: (BuildContext context) => Stroop(),
        REMEMBER_ROUTE_NAME: (BuildContext context) => Remember(),
        TIME_TRAINING_ROUTE_NAME: (BuildContext context) => TimeTraining(),
        RANDOM_CHALLENGE_ROUTE_NAME: (BuildContext context) =>
            RandomChallenge(),
        CHALLENGE_ROUTE_NAME: (BuildContext context) => TimedChallenge(),
      },
    );
  }
}

const TRAINING_ROUTE_NAME = '/training';
const STROOP_ROUTE_NAME = '/stroop';
const REMEMBER_ROUTE_NAME = '/remember';
const TIME_TRAINING_ROUTE_NAME = '/time_training';
const RANDOM_CHALLENGE_ROUTE_NAME = '/random_challenge';
const CHALLENGE_ROUTE_NAME = '/challenge';
