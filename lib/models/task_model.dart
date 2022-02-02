// TODO 1: Membuat Model
class TaskModel {
  final String id;
  final String taskName;
  final bool isComplete;

  TaskModel({
    required this.id,
    required this.taskName,
    this.isComplete = false,
  });
}
