import 'package:brain_jogging/about.dart';
import 'package:brain_jogging/headcalculation.dart';
import 'package:brain_jogging/home.dart';
import 'package:brain_jogging/rememeber.dart';
import 'package:brain_jogging/stroop.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brain Jogging',
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
        //primarySwatch: Colors.blue,
      ),
      home: Home(),
      routes: <String, WidgetBuilder>{
        '/headcalculation': (BuildContext context) => Headcalculation(),
        '/stroop': (BuildContext context) => Stroop(),
        '/remember': (BuildContext context) => Remember(),
        '/about': (BuildContext context) =>  About(),
      },
    );
  }
}
