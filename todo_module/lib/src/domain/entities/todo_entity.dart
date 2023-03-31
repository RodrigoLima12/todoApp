// ignore_for_file: public_member_api_docs, sort_constructors_first
class TodoEntity {
  final int id;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime targetDate;
  final DateTime? executedAt;

  const TodoEntity({
    required this.id,
    // this.id = 0, Outro modo de definir com valor default
    required this.title,
    required this.description,
    required this.createdAt,
    required this.targetDate,
    this.executedAt,
  });

  //Exceção não regra
  // TodoEntity copyWith({
  //   int? id,
  //   String? title,
  //   String? description,
  //   DateTime? createdAt,
  //   DateTime? targetDate,
  //   DateTime? executedAt,
  // }) {
  //   return TodoEntity(
  //     id: id ?? this.id,
  //     title: title ?? this.title,
  //     description: description ?? this.description,
  //     createdAt: createdAt ?? this.createdAt,
  //     targetDate: targetDate ?? this.targetDate,
  //     executedAt: executedAt ?? this.executedAt,
  //   );
  // }
}
