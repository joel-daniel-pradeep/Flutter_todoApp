import './my_button.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSaved;
  DialogBox({
    required this.controller,
    required this.onSaved,
  });
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "add a new task",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Mybutton(
                      text: "Save",
                      onPressed: () {
                        onSaved();
                      }),
                  SizedBox(
                    width: 8,
                  ),
                  Mybutton(
                      text: "Cancel",
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ],
              )
            ],
          )),
    );
  }
}
