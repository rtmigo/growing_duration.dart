import 'dart:math';

/// Returns [n]th approximate item of the Fibonacci sequence.
int _fibonacciGoldenApprox(int n) {
  // на 71-м числе последовательности тест давал сбой: вместо 308061521170129 получалось
  // 308061521170130, далее погрешность возрастала
  const double goldenRatio =
      1.6180339887498948482045868343656381177203091798057628621354486227052604628189024497072;
  return (pow(goldenRatio, n) / sqrt(5)).round();
}

abstract class VariableDuration {
  Duration next();

  void reset();
}

class ConstantDuration implements VariableDuration {
  ConstantDuration(this.duration);

  final Duration duration;

  @override
  Duration next() => this.duration;

  @override
  void reset() {}
}

class FibonacciDuration implements VariableDuration {
  final Duration step;
  final Duration limit;

  late double _stepSeconds;

  bool _isOverLimit = false;

  int get n => this._n;
  int _n = 0;

  FibonacciDuration(
      {this.step = const Duration(seconds: 1), this.limit = const Duration(days: 1)}) {
    if (this.limit < this.step) {
      throw ArgumentError('limit<step');
    }
    this._stepSeconds = this.step.inMicroseconds / Duration.microsecondsPerSecond;
  }

  @override
  Duration next() {
    if (_isOverLimit) {
      return limit;
    }

    var fibnum = _fibonacciGoldenApprox(++_n);
    var d = Duration(seconds: (this._stepSeconds * fibnum).round());
    if (d > this.limit) {
      _isOverLimit = true;
      return limit;
    }

    return d;
  }

  @override
  void reset() {
    this._isOverLimit = false;
    this._n = 0;
  }
}
