import 'dart:math';

import 'package:todo_module/src/domain/dtos/add_todo_dto.dart';
import 'package:todo_module/src/domain/entities/todo_entity.dart';

class TodoMapper {
  TodoMapper._();

  static Map<String, dynamic> dtoToMap(AddTodoDto dto) {
    return {
      'id': Random().nextInt(9999).toString(),
      'title': dto.title,
      'description': dto.description,
      'targetDate': dto.targetDate.millisecondsSinceEpoch,
      'createdAt': DateTime.now().millisecondsSinceEpoch,
    };
  }

  static TodoEntity fromMap(Map<String, dynamic> map) {
    return TodoEntity(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      targetDate: DateTime.fromMillisecondsSinceEpoch(map['targetDate']),
      executedAt:
          map['executedAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['executedAt']) : null,
    );
  }
}
