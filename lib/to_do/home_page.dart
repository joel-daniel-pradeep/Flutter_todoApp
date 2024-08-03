import './database.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import './todo_tile.dart';
import './dialog_box.dart';

class Homepage extends StatefulWidget {
  //const Homepage({super.key});
  @override
  Homepagestate createState() {
    return Homepagestate();
  }
}

class Homepagestate extends State<Homepage> {
  final con = TextEditingController();
  final mybox = Hive.box('mybox');
  TodoDatabase db = TodoDatabase();
  @override
  void initState() {
    //if app loaded for the first time
    if (mybox.get("TODOLIST") == null) {
      db.createInitialData();
    }
    //else there already exists database
    else {
      db.loadData();
    }
    super.initState();
  }

  void SavenewTask() {
    setState(() {
      db.TodoList.add([con.text, false]);
      con.clear();
    });
    db.updateData();
    Navigator.of(context).pop();
  }

  void checkboxchanged(bool? value, int index) {
    setState(() {
      db.TodoList[index][1] = !db.TodoList[index][1];
    });
    db.updateData();
  }

  void CreateNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: con,
            onSaved: SavenewTask,
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.TodoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          title: Center(
            child: Text("TO DO"),
          ),
          elevation: 0,
          backgroundColor: Colors.amber[200],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: CreateNewTask,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: db.TodoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskname: db.TodoList[index][0],
              taskCompleted: db.TodoList[index][1],
              onChanged: (value) => checkboxchanged(value, index),
              deletefunction: (context) => deleteTask(index),
            );
          },
        ));
  }
}
