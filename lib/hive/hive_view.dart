import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_learning/contact.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

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
            ),
            Expanded(child: _buildListView()),
          ],
        ),
      ),
    );
  }
  Widget _buildListView() {
    final contactsBox = Hive.box('contacts');
    return WatchBoxBuilder(
      box: Hive.box('contacts'),
      builder: (context, cantactBox) {
        return ListView.builder(
          itemCount: contactsBox.length,
          itemBuilder: (BuildContext context, int index) {
            final contact = contactsBox.get(index) as Contact;
            return Card(
              child: ListTile(
                title: Text(contact.name),
                subtitle: Text(contact.age.toString()),
              ),
            );
            // Show contacts
          },
        );
      }
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
               final _name = nameEditController!.text;
               final _age = ageEditController!.text;
                debugPrint(nameEditController!.text.toString());
                debugPrint(ageEditController!.text.toString());
                final newContact = Contact(_name, int.parse(_age));
                 addContact(newContact);
                nameEditController!.clear();
                ageEditController!.clear();
              },
            )
          ],
        ),
      ),
    );
  }
  void addContact(Contact contact) {
    final contactsBox = Hive.box('contacts');
    contactsBox.add(contact);
  }
}
