
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

class TimerCubit extends Cubit<TimerState>{
  TimerCubit():super(TimerInitial());

  Timer? _timer;
  final int _maxDuration = 5;

  void startTimer(){
    if(_timer != null){
      _timer!.cancel();
    }
    int _start = 0;
    emit(TimerRunning(progress: 0));
    _timer = Timer.periodic(const Duration(milliseconds: 700), (timer) {
      if (_start == _maxDuration){
        emit(TimerComplete());
        _timer!.cancel();
      }else{
        _start++;
        double progress = _start / _maxDuration;
        emit(TimerRunning(progress: progress));
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

}



abstract class TimerState{}

class TimerInitial extends TimerState{

}

class TimerRunning extends TimerState{
  final double progress;
  TimerRunning({required this.progress});

}
class TimerComplete extends TimerState{

}

