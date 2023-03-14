import 'package:flutter/widgets.dart';

abstract class GameWidget extends StatefulWidget {
  const GameWidget({Key? key, required this.setScore, required this.finished})
      : super(key: key);

  final Function(int score) setScore;
  final Function() finished;
}
