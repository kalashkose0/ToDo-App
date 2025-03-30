class TodoModel {
  String? title;
  String? desc;
  bool? isCompleted;
  int? priority; // 1 -> low(blue), 2 -> medium(orange), 3 -> high(red)
  String? assignedAt;
  String? completedAt;

  TodoModel({
    required this.title,
    required this.desc,
    this.isCompleted = false,
    this.priority = 1,
    required this.assignedAt,
    this.completedAt = "",
  });
}
