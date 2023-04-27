import 'dart:math';

class NumberGenerator {
  int generate() {
    var rn = Random();
    int num = rn.nextInt(100);
    return num;
  }
}
