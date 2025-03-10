import 'package:counter_with_bloc/bloc/counter_event.dart';
import 'package:counter_with_bloc/cubit/counter_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterStates> {
  CounterBloc() : super(CounterInitialState()) {
    on<CounterEvent>((event, emit) {
      if (event is AddCounterEvent) {
        increment(emit);
      } else if (event is MinusCounterEvent) {
        minus(emit);
      }
    });
  }

  int counter = 0;

  increment(Emitter<CounterStates> emit) {
    counter++;
    emit(CounterUpdatedState());
  }

  minus(Emitter<CounterStates> emit) {
    counter--;
    emit(CounterUpdatedState());
  }
}
