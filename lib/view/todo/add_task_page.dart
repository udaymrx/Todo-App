import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nicetodo/const/colors.dart';
import 'package:nicetodo/todo/provider/task_controller.dart';
import 'package:nicetodo/todo/state/task_state.dart';
import 'package:nicetodo/util/unique_id.dart';

class AddTaskPage extends ConsumerStatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends ConsumerState<AddTaskPage> {
  String task = "";
  String selected = "Personal";

  void saveTask() {
    if (task.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Task Can't be Empty.")),
      );
    } else {
      final id = createUniqueId();
      final todo = Task(title: task, id: id, category: selected);
      ref.read(tasksProvider.notifier).addTask(todo);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.highlight_off_rounded,
                      size: 40,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 160),
              TextField(
                style: Theme.of(context).textTheme.headlineSmall,
                decoration: const InputDecoration(
                  hintText: "Enter new Task",
                  border: InputBorder.none,
                ),
                onChanged: (val) {
                  setState(() {
                    task = val;
                  });
                },
              ),
              RadioListTile(
                value: 'Personal',
                title: const Text('Personal'),
                groupValue: selected,
                onChanged: (String? val) {
                  setState(() {
                    selected = val!;
                  });
                },
              ),
              RadioListTile(
                value: 'Business',
                title: const Text('Business'),
                groupValue: selected,
                activeColor: primarypink,
                onChanged: (String? val) {
                  setState(() {
                    selected = val!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: saveTask,
        backgroundColor: primaryblue,
        icon: const Icon(Icons.expand_less_rounded),
        label: const Text("New Task"),
      ),
    );
  }
}
