import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInit()) {
    on<IncrementEvent>(_increment);

    on<DecrementEvent>((event, emit) {
      emit(CounterUpdate(state.count - 1));
    });
  }

  FutureOr<void> _increment(IncrementEvent event, Emitter<CounterState> emit) {
    emit(CounterUpdate(state.count + 1));
  }
}
