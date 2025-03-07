import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nicetodo/const/colors.dart';
import 'package:nicetodo/router/router.gr.dart';
import 'package:nicetodo/todo/provider/task_controller.dart';
import 'package:nicetodo/view/todo/add_task_page.dart';
import 'package:nicetodo/view/widgets/category_card.dart';
import 'package:nicetodo/view/widgets/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: background,
        foregroundColor: black,
        leading: IconButton(
          onPressed: () async {
            context.pushRoute(const SettingsRoute());
            // await FirebaseAuth.instance.signOut();
          },
          icon: const Icon(Icons.drag_handle_outlined),
        ),
        leadingWidth: 70,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.bell),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Text(
                "What's up, ${user?.displayName ?? "Joy"} !",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff2d3252)),
              ),
            ),
            Text(
              'CATEGORIES',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: darkGrey,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: const [
                  CategoryCard(
                    title: 'Business',
                  ),
                  SizedBox(width: 14),
                  CategoryCard(
                    title: 'Personal',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "TODAY'S TASK",
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: darkGrey,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            Consumer(builder: (context, ref, child) {
              final taskState = ref.watch(tasksProvider);
              return taskState.when(
                (tasks) => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: ((context, index) => TodoTile(
                          task: tasks[index],
                        )),
                    itemCount: tasks.length),
                empty: () => SizedBox(
                  height: 300,
                  child: Center(
                      child: Text(
                    "No Task Here",
                    style: Theme.of(context).textTheme.titleMedium,
                  )),
                ),
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTaskPage(),
              fullscreenDialog: true,
            ),
          );
        },
        tooltip: 'Increment',
        backgroundColor: primaryblue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
