import 'package:flutter/material.dart';


class About extends StatelessWidget {
  const About({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About"),),
      body: Column(
        children: [
          Center(child: RichText(
              text: TextSpan(
                text: "Open Source App created with Flutter.",
                style: TextStyle(
                  //color: Colors.pink,
                  fontSize: 55,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900,
                  shadows: [Shadow(color: Colors.orange, blurRadius: 20)],
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 5
                    ..color = Colors.brown
                )
              ),
            ),
          ),
        ]
      )
    );
  }
}