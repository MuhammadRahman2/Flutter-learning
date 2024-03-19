import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  CounterEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class IncrementCounter extends CounterEvent{
}
class DecrementCounter extends CounterEvent{
}

class ResetCounter extends CounterEvent{
}