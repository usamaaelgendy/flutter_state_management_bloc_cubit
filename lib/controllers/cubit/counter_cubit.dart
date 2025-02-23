
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends HydratedCubit<CounterState> {
  CounterCubit() : super(const CounterInit());

  void increment() {
    emit(CounterUpdate(state.count + 1));
  }

  void decrement() {
    emit(CounterUpdate(state.count - 1));
  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterUpdate(json["count"]);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return {"count": state.count};
  }
}
