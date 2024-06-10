import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/dialogbox.dart';
import 'package:todoapp/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  final _myBox = Hive.box('myBox');
  TodoDataabase db = TodoDataabase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitalData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  // check Box was tapped

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    db.updateData();
    Navigator.of(context).pop();
  }

  //delete Task

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  //create new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialogbox(
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
          controller: _controller,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF69F7A6),
        appBar: AppBar(
          title: const Center(
              child: Text(
            'TO DO',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
          backgroundColor: Color(0xFF19BB4B),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              deleteFunction: (context) => deleteTask(index),
              name: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
            );
          },
        ));
  }
}
