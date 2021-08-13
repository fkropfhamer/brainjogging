import 'package:flutter/material.dart';

class Remember extends StatefulWidget {
  const Remember({ Key? key }) : super(key: key);

  @override
  _RememberState createState() => _RememberState();
}

class _RememberState extends State<Remember> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Remember"),),
      body: Column(
        children: [
          Center(child: Text("haha", style: TextStyle(fontSize: 30),),)
        ],
      ),
    );
  }
}