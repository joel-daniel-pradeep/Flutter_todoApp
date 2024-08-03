import 'package:flutter/material.dart';
import './home_page.dart';
import "package:hive_flutter/hive_flutter.dart";

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('mybox');
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "To Do App",
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      theme: ThemeData(primarySwatch: Colors.amber),
    );
  }
}
