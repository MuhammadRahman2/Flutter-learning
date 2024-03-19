import 'package:equatable/equatable.dart';

class SliderState extends Equatable{
  double? sliderValue ;
  bool? isSwitch;
  SliderState({this.sliderValue = 0.0, this.isSwitch = false});

  SliderState withCopy ({double? slider,bool? isSwitch}){
    return SliderState(
        sliderValue: slider ?? this.sliderValue,
        isSwitch: isSwitch ?? this.isSwitch
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [sliderValue,isSwitch];

}