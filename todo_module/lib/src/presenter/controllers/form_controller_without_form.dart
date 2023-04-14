import 'package:flutter/material.dart';

class FormControllerWithoutForm {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final dateNotifier =
      ValueNotifier(DateTime.now().add(const Duration(days: 1)));

  void changeDate(DateTime? date) {
    if (date == null) return;

    dateNotifier.value = date;
  }
}
