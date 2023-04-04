class AddTodoDto {
  final String title;
  final String description;
  final DateTime targetDate;

  const AddTodoDto({
    required this.title,
    required this.description,
    required this.targetDate,
  });
}
