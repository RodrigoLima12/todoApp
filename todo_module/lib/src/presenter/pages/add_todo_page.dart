// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_l10n/todo_l10n.dart';

import 'package:todo_module/src/presenter/controllers/form_controller.dart';
import 'package:todo_module/src/presenter/pages/widgets/todo_form_widget.dart';

class AddTodoPage extends StatelessWidget {
  final FormController formController;
  const AddTodoPage({
    Key? key,
    required this.formController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TO DO'),
      ),
      body: TodoFormWidget(formController: formController),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          formController.add();
        },
        label: ValueListenableBuilder(
          valueListenable: formController.store.selectLoading,
          builder: (_, isloading, child) {
            if (isloading) {
              return const CircularProgressIndicator(
                backgroundColor: Colors.cyan,
              );
            }
            return child!;
          },
          child: Text(context.l10n.add),
        ),
      ),
    );
  }
}
