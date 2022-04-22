import 'package:freezed_annotation/freezed_annotation.dart';

import 'task_state.dart';

part 'task_list_state.freezed.dart';

@freezed
class TaskList with _$TaskList {
  const factory TaskList(List<Task> tasks) = Data;
  const factory TaskList.empty() = Empty;
}
