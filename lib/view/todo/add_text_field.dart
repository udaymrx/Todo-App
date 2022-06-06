import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Key> _fields = [];

  final List<Widget> _textFields = [];

  void addFields() {
    final ukey = UniqueKey();
    _fields.add(ukey);
    addTextFields(ukey);
    debugPrint("$_fields");
    setState(() {});
  }

  void addTextFields(Key key) {
    _textFields.add(TextFormField(
      key: key,
      decoration: InputDecoration(
        hintText: "Enter text",
        suffix: IconButton(
            onPressed: () {
              removeFields(key);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.black,
            )),
      ),
    ));
  }

  void removeFields(Key id) {
    final index = _fields.indexOf(id);
    _textFields.removeAt(index);
    _fields.remove(id);
    debugPrint("$_fields");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [..._textFields],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addFields,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
