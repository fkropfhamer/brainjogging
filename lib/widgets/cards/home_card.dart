import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key, required this.text, required this.routeName})
      : super(key: key);

  final String text;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Card(
          child: InkWell(
              splashColor: Colors.blue.withAlpha(40),
              onTap: () => Navigator.of(context).pushNamed(this.routeName),
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