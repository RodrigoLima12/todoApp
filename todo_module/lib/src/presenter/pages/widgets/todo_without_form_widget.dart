import 'package:flutter/material.dart';
import 'package:todo_module/src/presenter/controllers/form_controller_without_form.dart';

class TodoFormWidgetWithoutForm extends StatelessWidget {
  const TodoFormWidgetWithoutForm({Key? key, required this.formController})
      : super(key: key);

  final FormControllerWithoutForm formController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(labelText: 'Título'),
          controller: formController.titleController,
        ),
        TextField(
          decoration: const InputDecoration(labelText: 'Descrição'),
          controller: formController.descriptionController,
        ),
        ValueListenableBuilder(
          valueListenable: formController.dateNotifier,
          builder: (context, date, child) {
            return GestureDetector(
              onTap: () async {
                final tomorrow = DateTime.now().add(const Duration(days: 1));
                final lastDate = DateTime.now().add(const Duration(days: 30));
                final result = await showDatePicker(
                  context: context,
                  initialDate: tomorrow,
                  firstDate: tomorrow,
                  lastDate: lastDate,
                );
                formController.changeDate(result);
              },
              child: Text(date.toString()),
            );
          },
        )
      ],
    );
  }
}
