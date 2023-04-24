// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:todo_module/src/domain/entities/todo_entity.dart';

import 'package:todo_module/src/presenter/stores/todos_store.dart';

class HomePage extends StatefulWidget {
  final TodosStore store;
  final ConnectionStore connectionStore;
  final SyncStore syncStore;

  const HomePage({
    Key? key,
    required this.store,
    required this.connectionStore,
    required this.syncStore,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ConnectionStore get connectionStore => widget.connectionStore;
  TodosStore get store => widget.store;
  SyncStore get syncStore => widget.syncStore;

  @override
  void initState() {
    super.initState();
    store.getTodos();
  }

  Future<void> sync() async {
    await syncStore.sync();
    await store.getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TO DO'),
        actions: [
          IconButton(
            onPressed: store.getTodos,
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: sync,
            icon: const Icon(Icons.sync),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ValueListenableBuilder(
              valueListenable: connectionStore.selectState,
              builder: (_, value, __) {
                if (connectionStore.isOnline) {
                  return Icon(Icons.wifi);
                }
                return Icon(Icons.wifi_off);
              },
            ),
          ),
        ],
      ),
      body: ScopedBuilder<TodosStore, List<TodoEntity>>(
        store: store,
        onState: (_, todos) => ListView.builder(
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              todos.elementAt(index).title,
              style: const TextStyle(fontSize: 18),
            ),
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
