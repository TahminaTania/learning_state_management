import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial(count: 'abc'));
  void newValue(newValue) => emit(CounterInitial(count: newValue));
  // void increment() => emit(CounterInitial(count: state.count + 3));
  //void decrement() => emit(CounterInitial(count: state.count - 1));
}
