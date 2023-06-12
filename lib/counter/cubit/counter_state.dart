part of 'counter_cubit.dart';

@immutable
abstract class CounterState {
  get count => '';
}

class CounterInitial extends CounterState {
  late String count;
  CounterInitial({required this.count});
}
