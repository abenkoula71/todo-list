import 'package:flutter/material.dart';

/// ListTile widget
class TaskListTile extends StatelessWidget {
  TaskListTile(
      {required this.taskTitle,
      required this.isChecked,
      this.checkboxCallback});
  late final bool isChecked;
  final String taskTitle;
  final Function(void)? checkboxCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          taskTitle,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
            activeColor: Colors.lightBlueAccent,
            value: isChecked,
            onChanged: checkboxCallback));
  }
}
