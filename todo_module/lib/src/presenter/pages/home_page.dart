// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:todo_module/src/domain/entities/todo_entity.dart';

import 'package:todo_module/src/presenter/stores/todos_store.dart';

class HomePage extends StatefulWidget {
  final TodosStore store;
  const HomePage({Key? key, required this.store}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TodosStore get store => widget.store;
  @override
  void initState() {
    super.initState();
    store.getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TO DO'),
      ),
      body: ScopedBuilder<TodosStore, List<TodoEntity>>(
        store: store,
        onState: (_, todos) => ListView.builder(
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(todos.elementAt(index).title, style: const TextStyle(fontSize: 18),),
          ),
          itemCount: todos.length,
        ),
        onLoading: (_) => const Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Modular.to.pushNamed('add');
        },
        label: const Text('Adicionar'),
      ),
    );
  }
}
