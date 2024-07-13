import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/favourite_cubit/favourite_cubit.dart';

class FavouriteView extends StatefulWidget {
   FavouriteView({super.key});

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  // bool isFavourite = true;

  @override
  Widget build(BuildContext context) {
    debugPrint('build Favourite view');
    return Scaffold(
      appBar: AppBar(title: const Text('Favourite View'),
      ),
      body: BlocBuilder<FavouriteCube,bool>(
        builder: (context, favouriteCubeState) {
          debugPrint('build bloc builder');
          return FilledButton.icon(
              onPressed: () => context.read<FavouriteCube>().favouriteChange(),
              icon: favouriteCubeState ? const Icon(Icons.favorite,color: Colors.red,): const  Icon(Icons.favorite_border_outlined),
              label: const Text('favourite'),
          );
        }
      )
    );
  }
}
