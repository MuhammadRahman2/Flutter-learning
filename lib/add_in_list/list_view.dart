import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/add_in_list/list_bloc/list_bloc.dart';
import 'package:flutter_learning/add_in_list/list_bloc/list_event.dart';
import 'package:flutter_learning/add_in_list/list_bloc/list_state.dart';

class ListViewScreen extends StatelessWidget {
  ListViewScreen({super.key});

  TextEditingController controller = TextEditingController();
  TextEditingController updateCont  =TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.read<ListBloc>().add(InitialValueList());
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
          TextField(
            controller: controller,
            onSubmitted: (value) {
              context.read<ListBloc>().add(ValueAddList(value));
              controller.clear();
            },
          ),
          BlocBuilder<ListBloc,ListState>(
              builder: (context, state) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: state.listData!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Text(state.listData![index].toString()),
                            trailing: Container(
                              width: 100,
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: (){
                                      context.read<ListBloc>().add(ValueDelete(state.listData![index]));
                                    }, icon: const Icon(Icons.delete),
                                  ),
                                  IconButton(
                                    onPressed: (){
                                      updateCont = TextEditingController(text: state.listData![index]);
                                      showDialog(
                                          context: context,
                                          builder:(context) {
                                            return SimpleDialog(
                                              children: [
                                                const SizedBox(height: 20),
                                                TextField(
                                                  controller: updateCont,
                                                ),
                                                ElevatedButton(onPressed: (){
                                                  context.read<ListBloc>().add(UpdateValue(index, updateCont.text,),);
                                                  updateCont.clear();
                                                  Navigator.pop(context);

                                                }, child: Text('Update Value'))
                                              ],
                                            );
                                          },
                                      );
                                    }, icon: const Icon(Icons.edit),
                                  ),
                              
                                ],
                              ),
                            ),
                        );
                      },
                  ),
                );
              },
          ),
        ],
      ),
    );
  }
}
