import 'package:flutter/material.dart';

class FormController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final dateNotifier =
      ValueNotifier(DateTime.now().add(const Duration(days: 1)));

  void changeDate(DateTime? date) {
    if (date == null) return;

    dateNotifier.value = date;
  }

  void add() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
  }
}