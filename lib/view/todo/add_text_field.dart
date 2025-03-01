import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:nicetodo/router/router.gr.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Map<Key, Widget> _uniqueFields = {};

  void addInMap() {
    final ukey = UniqueKey();
    _uniqueFields.putIfAbsent(
        ukey,
        () => TextFormField(
              key: ukey,
              decoration: InputDecoration(
                hintText: "Enter text",
                suffix: IconButton(
                    onPressed: () {
                      removeFromMap(ukey);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                    )),
              ),
            ));
    setState(() {});
  }

  void removeFromMap(Key id) {
    _uniqueFields.remove(id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add TextField"),
        actions: [
          IconButton(
            onPressed: () {
              context.navigateTo(const SimplePhotoViewDemoRoute());
            },
            icon: const Icon(Icons.keyboard_arrow_right),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: _uniqueFields.values.toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addInMap,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
