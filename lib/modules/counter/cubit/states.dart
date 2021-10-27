abstract class CounterStates {}

class IntialCounterState extends CounterStates {}

class MinusCounterState extends CounterStates {
  final counter;

  MinusCounterState(this.counter);
}

class PlusCounterState extends CounterStates {
  final counter;

  PlusCounterState(this.counter);
}
