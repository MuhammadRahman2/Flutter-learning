
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCubit extends Cubit<List<String>>{
  ListCubit(): super(['One']);

  /// list.form it make copy list to presvis list we can't modify that list
  /// in cubit and bloc

  void addValue(String item){
    final newlist = List<String>.from(state)..add(item);
    emit(newlist);
  }

  void updateValue(int index,String newValues){
    final newlist = List<String>.from(state);
    newlist[index] = newValues;
    emit(newlist);
  }

  void deleteValue(int index){
    final newValue = List<String>.from(state)..removeAt(index);
    emit(newValue);
  }

}