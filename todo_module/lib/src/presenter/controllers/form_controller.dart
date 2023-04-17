import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:todo_module/src/domain/dtos/add_todo_dto.dart';

import 'package:todo_module/src/presenter/stores/add_todo_store.dart';

class FormController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final dateNotifier =
      ValueNotifier(DateTime.now().add(const Duration(days: 1)));

  final AddTodoStore store;

  FormController({required this.store}) {
    store.observer(
      onError: (e) {
        SnackbarService.instance.showSnackbar(
          SnackBar(
            content: Text(e.message),
          ),
        );
      },
    );
  }

  void changeDate(DateTime? date) {
    if (date == null) return;

    dateNotifier.value = date;
  }

  Future<void> add() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    AddTodoDto dto = AddTodoDto(
      title: titleController.text,
      description: descriptionController.text,
      targetDate: dateNotifier.value,
    );

    await store.addTodo(dto);
  }
}
