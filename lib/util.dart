import 'dart:math';

var random = Random();

// min inclusive, max exclusive
int randomInt({int min = 0, required int max}) {
  return min + random.nextInt(max - min);
}