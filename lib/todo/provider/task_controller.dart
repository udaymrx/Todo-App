import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/task_list_state.dart';
import '../state/task_state.dart';

final tasksProvider = StateNotifierProvider<TaskListNotifier, TaskList>((ref) {
  return TaskListNotifier();
});

class TaskListNotifier extends StateNotifier<TaskList> {
  TaskListNotifier() : super(const TaskList.empty());

  void addTask(Task task) {
    if (state is Empty) {
      /// when TaskList is Empty
      state = TaskList([task]);
    } else if (state is Data) {
      /// when TaskList has some Tasks
      List<Task> oldList = [];
      state.maybeWhen((tasks) {
        oldList = tasks;
      }, orElse: () {});

      oldList.add(task);

      state = TaskList(oldList);
    }
  }

  void removeTask(int id) {
    List<Task> oldList = [];
    state.maybeWhen((tasks) {
      oldList = tasks;
    }, orElse: () {});

    // remove task with id
    oldList.removeWhere((task) => task.id == id);

    if (oldList.isEmpty) {
      state = const TaskList.empty();
    } else {
      state = TaskList(oldList);
    }
  }

  void markDone(int id, {required bool isDone}) {
    List<Task> oldList = [];
    state.maybeWhen((tasks) {
      oldList = tasks;
    }, orElse: () {});

    // get the index of the Task
    final index = oldList.indexWhere((tsk) => tsk.id == id);

    // get the Task from index
    final old = oldList.elementAt(index);

    // remove the old Task
    oldList.removeAt(index);

    // create a new Task instance
    Task ntsk;

    // initiate the new task with incoming isDone value
    ntsk = old.copyWith(isDone: isDone);

    // insert the new Task instance at the same index where pervious task was
    oldList.insert(index, ntsk);

    state = TaskList(oldList);
  }
}
