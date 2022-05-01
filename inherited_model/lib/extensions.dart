import 'dart:math' show Random;
import 'dart:developer' as devtools show log;

extension RandomColor<T> on Iterable<T> {
  T getRandomElement() => elementAt(Random().nextInt(length));
}

extension Log on Object {
  void log() => devtools.log(toString());
}
