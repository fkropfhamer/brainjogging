import 'package:flutter/material.dart';

class TrainingCard extends StatelessWidget {
  const TrainingCard({
    super.key,
    required this.text,
    required this.target,
    this.color = Colors.white,
  });

  final String text;
  final Widget target;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            color: color,
            child: InkWell(
              splashColor: Colors.blue.withAlpha(40),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => target),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
