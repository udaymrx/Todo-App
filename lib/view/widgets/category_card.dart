import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_practice/const/colors.dart';

import '../../todo/provider/task_controller.dart';

class CategoryCard extends ConsumerWidget {
  const CategoryCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskState = ref.watch(tasksProvider);

    return taskState.when((tasks) {
      int doneTask = 0;
      int totalTask = 0;

      tasks.forEach((tsk) {
        if (tsk.category == title) {
          totalTask++;
          if (tsk.isDone) {
            doneTask++;
          }
        }
      });
      final double? progress = totalTask > 0 ? (doneTask / totalTask) * 152 : 0;

      return Center(
        child: Container(
          width: 180,
          height: 100,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                blurRadius: 12,
                blurStyle: BlurStyle.outer,
                color: shadow,
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  '$totalTask Tasks',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: mediumGrey),
                ),
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Spacer(),
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    height: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: lightGrey,
                    ),
                  ),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        height: 4,
                        width: progress,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color:
                              title == "Business" ? primarypink : primaryblue,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 4),
                              color: title == "Business"
                                  ? const Color.fromRGBO(235, 0, 255, 0.46)
                                  : const Color.fromRGBO(18, 104, 237, 0.46),
                              blurRadius: 8,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 8,
                        width: 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color:
                              title == "Business" ? primarypink : primaryblue,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 4),
                              color: title == "Business"
                                  ? const Color.fromRGBO(235, 0, 255, 0.46)
                                  : const Color.fromRGBO(18, 104, 237, 0.46),
                              blurRadius: 8,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }, empty: () {
      return Center(
        child: Container(
          width: 180,
          height: 100,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                blurRadius: 12,
                blurStyle: BlurStyle.outer,
                color: shadow,
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  '0 Tasks',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: mediumGrey),
                ),
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Spacer(),
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    height: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: lightGrey,
                    ),
                  ),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        height: 4,
                        width: 0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color:
                              title == "Business" ? primarypink : primaryblue,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 4),
                              color: title == "Business"
                                  ? const Color.fromRGBO(235, 0, 255, 0.46)
                                  : const Color.fromRGBO(18, 104, 237, 0.46),
                              blurRadius: 8,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 8,
                        width: 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color:
                              title == "Business" ? primarypink : primaryblue,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 4),
                              color: title == "Business"
                                  ? const Color.fromRGBO(235, 0, 255, 0.46)
                                  : const Color.fromRGBO(18, 104, 237, 0.46),
                              blurRadius: 8,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
