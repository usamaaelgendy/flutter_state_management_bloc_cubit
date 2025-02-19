part of 'counter_cubit.dart';

sealed class CounterState {
  final int count;

  const CounterState(this.count);
}

class CounterInit extends CounterState {
  const CounterInit() : super(0);
}

class CounterUpdate extends CounterState {
  const CounterUpdate(super.count);
}
