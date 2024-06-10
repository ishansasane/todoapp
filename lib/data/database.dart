import 'package:hive_flutter/hive_flutter.dart';

class TodoDataabase {
  final _myBox = Hive.box('myBox');

  List toDoList = [];

  void createInitalData() {
    toDoList = [
      ['Give Me Paisa', false],
    ];
  }

  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateData() {
    _myBox.put("TODOLIST", toDoList);
  }
}
