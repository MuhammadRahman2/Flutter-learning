import 'package:equatable/equatable.dart';

abstract class SliderEvent extends Equatable{
  SliderEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class SwitchValueChange extends SliderEvent{

}

class SliderValueChange extends SliderEvent{
  final double newValue;

  SliderValueChange({required this.newValue});

  @override
  List<Object?> get props => [newValue];

}