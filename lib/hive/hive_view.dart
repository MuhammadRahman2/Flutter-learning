import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HiveView extends StatelessWidget {
  HiveView({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Hive'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CardDataAdd(
              nameEditController: nameController,
              ageEditController: ageController,
            )
          ],
        ),
      ),
    );
  }
}

class CardDataAdd extends StatelessWidget {
  CardDataAdd(
      {super.key,
      required this.nameEditController,
      required this.ageEditController});

  TextEditingController? nameEditController;
  TextEditingController? ageEditController;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade100.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        child: Column(
          children: [
            TextField(
              controller: nameEditController,
              decoration: const InputDecoration(
                hintText: 'Name',
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: ageEditController,
              decoration: const InputDecoration(
                hintText: 'Age',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            CupertinoButton(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(20),
              child: const Text('Save'),
              onPressed: () {
                debugPrint(nameEditController!.text.toString());
                debugPrint(ageEditController!.text.toString());
                nameEditController!.clear();
                ageEditController!.clear();
              },
            )
          ],
        ),
      ),
    );
  }
}
