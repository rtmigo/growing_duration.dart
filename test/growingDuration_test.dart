import 'dart:core';

import 'package:growing_duration/growing_duration.dart';
import 'package:test/test.dart';

void main() {
  test('grow', () async {
    var lst1 = [];

    var fd = FibonacciDuration();
    for (var i = 0; i < 30; ++i) {
      lst1.add(fd.next().inSeconds);
    }

    expect(lst1, [
      1,
      1,
      2,
      3,
      5,
      8,
      13,
      21,
      34,
      55,
      89,
      144,
      233,
      377,
      610,
      987,
      1597,
      2584,
      4181,
      6765,
      10946,
      17711,
      28657,
      46368,
      75025,
      86400,
      86400,
      86400,
      86400,
      86400
    ]);

    fd.reset();

    var lst2 = [];

    for (var i = 0; i < 30; ++i) {
      lst2.add(fd.next().inSeconds);
    }

    expect(lst2, [
      1,
      1,
      2,
      3,
      5,
      8,
      13,
      21,
      34,
      55,
      89,
      144,
      233,
      377,
      610,
      987,
      1597,
      2584,
      4181,
      6765,
      10946,
      17711,
      28657,
      46368,
      75025,
      86400,
      86400,
      86400,
      86400,
      86400
    ]);
  });
}
