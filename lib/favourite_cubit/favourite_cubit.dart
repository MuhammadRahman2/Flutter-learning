import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteCube extends Cubit<bool>{
  FavouriteCube(): super(false);

  void favouriteChange (){
    emit(!state);
  }
}