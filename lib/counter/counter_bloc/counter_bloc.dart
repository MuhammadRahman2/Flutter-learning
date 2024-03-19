import 'package:bloc/bloc.dart';
import 'package:flutter_learning/counter/counter_bloc/bloc_event.dart';
import 'package:flutter_learning/counter/counter_bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent,CounterState>{
  CounterBloc():super (CounterState()){
    on<IncrementCounter>(incrementValue);
    on<DecrementCounter>(decrementValue);
    on<ResetCounter>(resetValue);
  }

  void incrementValue(IncrementCounter event, Emitter<CounterState> emit){
  emit(state.copyWith(counter: state.counter! + 1));
  print(state.copyWith(counter: state.counter! + 1));
  }

  void decrementValue(DecrementCounter event, Emitter<CounterState> emit){
    if (state.counter! > 0){
      emit(state.copyWith(counter:  state.counter! - 1));
    }
  }

  void resetValue(ResetCounter event, Emitter<CounterState> emit){
    emit(CounterState());
  }

}