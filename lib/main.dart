import 'package:brainjogging/about.dart';
import 'package:brainjogging/challenge.dart';
import 'package:brainjogging/headcalculation.dart';
import 'package:brainjogging/home.dart';
import 'package:brainjogging/random_challenge.dart';
import 'package:brainjogging/rememeber.dart';
import 'package:brainjogging/stroop.dart';
import 'package:brainjogging/time_training.dart';
import 'package:brainjogging/training.dart';
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
        TRAINING_ROUTE_NAME: (BuildContext context) => Training(),
        HEADCALCULATION_ROUTE_NAME: (BuildContext context) => Headcalculation(),
        STROOP_ROUTE_NAME: (BuildContext context) => Stroop(),
        REMEMBER_ROUTE_NAME: (BuildContext context) => Remember(),
        TIME_TRAINING_ROUTE_NAME: (BuildContext context) => TimeTraining(),
        RANDOM_CHALLENGE_ROUTE_NAME: (BuildContext context) => RandomChallenge(),
        CHALLENGE_ROUTE_NAME: (BuildContext context) => Challenge(),
        '/about': (BuildContext context) =>  About(),
      },
    );
  }
}

const TRAINING_ROUTE_NAME = '/training';
const HEADCALCULATION_ROUTE_NAME = '/headcalculation';
const STROOP_ROUTE_NAME = '/stroop';
const REMEMBER_ROUTE_NAME = '/remember';
const TIME_TRAINING_ROUTE_NAME = '/time_training';
const RANDOM_CHALLENGE_ROUTE_NAME = '/random_challenge';
const CHALLENGE_ROUTE_NAME = '/challenge';
