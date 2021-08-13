import 'dart:math';
import 'package:flutter/material.dart';

class Remember extends StatefulWidget {
  const Remember({ Key? key }) : super(key: key);

  @override
  _RememberState createState() => _RememberState();
}

const fadeDurationMs = 500;
const visibileDurationMs = 200;
const pauseDurationMs = 100;
const fadeDuration = const Duration(milliseconds: fadeDurationMs);
const visibileDuration = const Duration(milliseconds: fadeDurationMs + visibileDurationMs);
const pauseDuration = const Duration(milliseconds: fadeDurationMs + pauseDurationMs);

var random = Random();

List<int> _generateSequence() {
    List<int> seq = [];

    for (var i = 0; i < 5; i++) {
      seq.add(random.nextInt(9));
    }

    return seq;
  }

class _RememberState extends State<Remember> {
  var _visible = false;
  var _running = false;
  var _number = 0;

  _start() async {
    if (_running) {
      return;
    }
    _running = true;
    var seq = _generateSequence();

    print(seq);
  
    for (var i = 0; i < seq.length; i++) {
      setState(() {
        _visible = true;
        _number = seq[i];
      });
      await Future.delayed(visibileDuration);
      setState(() {
        _visible = false;
      });
      await Future.delayed(pauseDuration);
    }
    _running = false;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Remember"),),
      body: Column(
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: fadeDurationMs),
            opacity: _visible ? 1.0 : 0.0,
           child: Center(child: Text(_number.toString() , style: TextStyle(fontSize: 30),),),
          ),
          ElevatedButton(
            onPressed: () => { _start() },
            child: const Text('Start'),
          )
        ],
      ),
    );
  }
}