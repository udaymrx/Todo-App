import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_practice/const/colors.dart';
import 'package:freezed_practice/todo/provider/task_controller.dart';

import '../../todo/state/task_state.dart';

class TodoTile extends ConsumerStatefulWidget {
  const TodoTile({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  _TodoTileState createState() => _TodoTileState();
}

class _TodoTileState extends ConsumerState<TodoTile> {
  late bool isRemoved;

  Future<bool> onDismiss() {
    return Future.delayed(const Duration(seconds: 2), () {
      if (isRemoved) {
        ref.read(tasksProvider.notifier).removeTask(widget.task.id);
      }
      return isRemoved;
    });
  }

  @override
  void initState() {
    super.initState();
    isRemoved = true;
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ObjectKey(widget.task.id),
      onUpdate: (ds) {
        isRemoved = true;
      },
      background: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(
                CupertinoIcons.delete,
                color: mediumGrey,
              ),
            ),
            Expanded(
                child: Text(
              "The task was deleted",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: darkGrey),
            )),
            OutlinedButton(
              onPressed: () {
                isRemoved = false;
              },
              style: OutlinedButton.styleFrom(
                shape: const StadiumBorder(),
              ),
              child: const Text(
                "UNDO",
                style: TextStyle(color: black),
              ),
            )
          ],
        ),
      ),
      confirmDismiss: (direc) => onDismiss(),
      child: Column(
        children: [
          ListTile(
            tileColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            leading: IconButton(
              icon: widget.task.isDone
                  ? const Icon(
                      Icons.check_circle_rounded,
                      color: mediumGrey,
                    )
                  : Icon(
                      Icons.circle_outlined,
                      color: widget.task.category == 'Business'
                          ? primarypink
                          : primaryblue,
                    ),
              onPressed: () {
                ref
                    .read(tasksProvider.notifier)
                    .markDone(widget.task.id, isDone: !widget.task.isDone);
              },
            ),
            title: Text(
              widget.task.title,
              style: TextStyle(
                color: black,
                decoration: widget.task.isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
