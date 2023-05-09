import 'package:flutter/widgets.dart';

abstract class GameWidget extends StatefulWidget {
  const GameWidget({Key? key, required this.setScore, required this.finished, this.numTasks})
      : super(key: key);

  final int? numTasks;
  final Function(int score) setScore;
  final Function() finished;
}
