import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/list_cubit/list_cubit.dart';

class ListCubitView extends StatelessWidget {
   ListCubitView({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: const Text('List Cubit'),
      ),
      body: BlocBuilder<ListCubit,List<String>>(
        builder: (context, listNumber) {
        return ListView.builder(
          itemCount: listNumber.length,
          itemBuilder: (context,index) {
            return ListTile(
              title: Text(listNumber[index].toString() ?? ''),
              leading: IconButton(
                onPressed: ()=>  context.read<ListCubit>().updateValue(index, 'Updated'),
                icon: const Icon(Icons.edit),
              ),
              trailing: IconButton(onPressed: (){
                context.read<ListCubit>().deleteValue(index);
              }, icon: const Icon(Icons.delete),
              ),
            );
          }
        );
      },
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: (){
         context.read<ListCubit>().addValue('Two');
      },
        child: const Icon(Icons.add),
      ),

    );
  }
}
