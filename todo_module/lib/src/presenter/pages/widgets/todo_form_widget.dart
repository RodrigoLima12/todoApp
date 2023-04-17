import 'package:flutter/material.dart';
import 'package:todo_module/src/presenter/controllers/form_controller.dart';

class TodoFormWidget extends StatelessWidget {
  const TodoFormWidget({Key? key, required this.formController})
      : super(key: key);

  final FormController formController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formController.formKey,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Titulo deve ser preenchido';
                }
                return null;
              },
              decoration: const InputDecoration(labelText: 'Título'),
              controller: formController.titleController,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Descrição deve ser preenchido';
                }
                if (value.trim().length < 5) {
                  return 'Descrição deve possuir tamanho maior que 5 caracteres';
                }
                return null;
              },
              decoration: const InputDecoration(labelText: 'Descrição'),
              controller: formController.descriptionController,
            ),
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
                    initialDate: date,
                    firstDate: tomorrow,
                    lastDate: lastDate,
                  );
                  formController.changeDate(result);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(date.toString()),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
