import 'package:equatable/equatable.dart';

class ListState extends Equatable{
  final List? listData;
  ListState({this.listData = const []});

  ListState copyWith ({List? list}){
    return ListState(
      listData: list ?? this.listData
    );
}


  @override
  // TODO: implement props
  List<Object?> get props => [listData];

}