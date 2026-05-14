import 'dart:async';

import 'package:brainjogging/widgets/games/game_widget.dart';
import 'package:flutter/material.dart';

class Timing extends GameWidget {
  Timing({super.key, required super.setScore, super.finished});

  @override
  State<Timing> createState() => _TimingState();
}

class _TimingState extends State<Timing> {
  String _text = "";
  bool _isStarted = false;
  final _stopwatch = Stopwatch();

  void _start() async {
    _isStarted = true;
    setState(() {
      _text = "3";
    });
    for (var i = 3; i > 0; i--) {
      setState(() {
        _text = "$i";
      });
      await Future.delayed(Duration(seconds: 1));
    }
    _stopwatch.reset();
    _stopwatch.start();

    setState(() {
      _text = "";  
    });
  }

  void _stop() {
    _stopwatch.stop();
    setState(() {
      _isStarted = false;
      _text = "${_stopwatch.elapsed.inSeconds}";  
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text("Press Stop after 30 Seconds"),
        ),
        ListTile(
          title: Text(_text)
        ),
        () {if (!_isStarted) {
          return ElevatedButton(onPressed: _start, child: Text("Start"));
        } else {
          return ElevatedButton(onPressed: _stop, child: Text("Stop"));
        }}()
      ],
    );
  }
}