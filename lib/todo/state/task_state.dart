import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_state.freezed.dart';

@freezed
class Task with _$Task {
  factory Task(
      {required String title,
      @Default(false) bool isDone,
      required int id,
      required String category}) = _Task;
}
