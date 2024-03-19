import 'package:bloc/bloc.dart';
import 'package:flutter_learning/add_in_list/list_bloc/list_event.dart';
import 'package:flutter_learning/add_in_list/list_bloc/list_state.dart';

class ListBloc extends Bloc<ListEvent,ListState>{
  List<String> todoList = ['1','2','3'];

  ListBloc(): super (ListState(listData: [])){
    // add(InitialValueList());
    on<InitialValueList>(initializeList);
    on<ValueAddList>(listAddData);
    on<ValueDelete>(listDeleteValue);
    on<UpdateValue>(updateValue);
}
  void initializeList(InitialValueList event, Emitter<ListState> emit) {
    // Initialize the list here, if necessary
    emit(state.copyWith(list: List.from(todoList)));
  }

  void listAddData(ValueAddList event,Emitter<ListState> emit){
    // method1
    todoList.add(event.newValue);
    emit(state.copyWith(list: List.from(todoList),),);
    
    // method2 
    // emit(state.copyWith(list: List.from(state.listData ??[])..add(event.newValue)));
}

void listDeleteValue(ValueDelete event,Emitter<ListState> emit){
    todoList.remove(event.deleteValue);
    emit(state.copyWith(list: List.from(todoList)));
}

void updateValue(UpdateValue event, Emitter<ListState> emit){
    todoList[event.index] = event.updateValue;
    emit(state.copyWith(list: List.from(todoList)));
}

}