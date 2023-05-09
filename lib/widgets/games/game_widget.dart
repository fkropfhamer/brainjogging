import 'package:flutter/widgets.dart';

abstract class GameWidget extends StatefulWidget {
  GameWidget({Key? key, required this.setScore, Function()? finished, this.numTasks})
      : super(key: key) {
    this.finished = finished ?? (() {});
  }

  final int? numTasks;
  final Function(int score) setScore;
  late final Function() finished;
}
