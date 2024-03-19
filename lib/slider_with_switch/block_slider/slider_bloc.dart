import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/slider_with_switch/block_slider/slider_event.dart';
import 'package:flutter_learning/slider_with_switch/block_slider/slider_state.dart';

class SliderBloc extends Bloc<SliderEvent,SliderState>{
  SliderBloc(): super(SliderState()){
    on<SliderValueChange>(sliderValueUpdate);
    on<SwitchValueChange>(switchValue);
  }

  void sliderValueUpdate(SliderValueChange event,Emitter<SliderState> emit){
    emit(state.withCopy(slider: event.newValue));
  }

  void switchValue(SwitchValueChange event , Emitter<SliderState> emit){
    emit(state.withCopy(isSwitch: !state.isSwitch!));
  }

}