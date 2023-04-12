import 'package:flutter_test/flutter_test.dart';
import 'package:todo_module/src/domain/entities/todo_entity.dart';
import 'package:todo_module/src/external/mappers/todo_mapper.dart';

void main() {
  test(
    "Should return a TodoEntity when createdAt isn't null",
    () async {
      final result = TodoMapper.fromMap(
        {
          'id': 0,
          'title': '',
          'description': '',
          'createdAt': 0,
          'targetDate': 0,
          'executedAt': DateTime.now().millisecondsSinceEpoch,
        },
      );

      //Arrange
      expect(result, isA<TodoEntity>());

      expect(result.executedAt, isNotNull);
    },
  );
}
