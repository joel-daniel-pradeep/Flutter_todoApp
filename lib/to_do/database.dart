import "package:hive_flutter/hive_flutter.dart";

class TodoDatabase {
  List TodoList = [];

  //reference our box
  final mybox = Hive.box("mybox");

  //run this method if the app is opened for the 1st time
  void createInitialData() {
    TodoList = [
      ["make tutorial", false],
      ["do exercise", false],
    ];
  }

  //load the data
  void loadData() {
    TodoList = mybox.get("TODOLIST");
  }

  //update the data

  void updateData() {
    mybox.put("TODOLIST", TodoList);
  }
}
