// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:todo_module/src/presenter/controllers/form_controller.dart';

class HomePage extends StatefulWidget {
  final FormController formController;
  const HomePage({
    Key? key,
    required this.formController,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now().add(const Duration(days: 1));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TO DO'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Título'),
            controller: widget.formController.titleController,
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Descrição'),
            controller: widget.formController.descriptionController,
          ),
          GestureDetector(
            onTap: () async {
              final tomorrow = DateTime.now().add(const Duration(days: 1));
              final lastDate = DateTime.now().add(const Duration(days: 30));
              final result = await showDatePicker(
                context: context,
                initialDate: tomorrow,
                firstDate: tomorrow,
                lastDate: lastDate,
              );
              if (result == null) {
                return;
              } else {
                setState(() {
                  selectedDate = result;
                });
              }
            },
            child: Text(selectedDate.toString()),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Adicionar'),
      ),
    );
  }
}
