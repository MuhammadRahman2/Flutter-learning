import 'package:equatable/equatable.dart';

abstract class ListEvent extends Equatable{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialValueList extends ListEvent{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ValueAddList extends ListEvent{
  dynamic newValue;
  ValueAddList(this.newValue);

  @override
  // TODO: implement props
  List<Object?> get props => [newValue];
}

class ValueDelete extends ListEvent{
  final Object? deleteValue;
  ValueDelete(this.deleteValue);

  @override
  // TODO: implement props
  List<Object?> get props => [deleteValue];
}

class UpdateValue extends ListEvent{
  final int index;
final String updateValue;


UpdateValue(this.index,this.updateValue,);

@override
  // TODO: implement props
  List<Object?> get props => [index,updateValue,];

}