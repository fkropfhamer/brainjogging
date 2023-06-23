import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key, required this.text, required this.target})
      : super(key: key);

  final String text;
  final Widget target;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Card(
      child: InkWell(
          splashColor: Colors.blue.withAlpha(40),
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => this.target)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(this.text,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))
            ],
          )),
    ));
  }
}
