import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  late final String taskname;
  late final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletefunction;
  TodoTile({
    //super.key,
    required this.taskname,
    required this.taskCompleted,
    required this.onChanged,
    required this.deletefunction,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
        child: Slidable(
          endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                onPressed: deletefunction,
                icon: Icons.delete,
                backgroundColor: Colors.red,
              )
            ],
          ),
          child: Container(
            padding: EdgeInsets.all(12.0),
            child: Row(
              children: [
                Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                ),
                Text(
                  taskname,
                  style: TextStyle(
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ));
  }
}
