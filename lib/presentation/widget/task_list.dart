/// ListView widget

import 'package:flutter/material.dart';
import 'package:todo_list/presentation/modal/tasks.dart';

import 'package:todo_list/presentation/widget/list_tile.dart';

class CustomListView extends StatefulWidget {
  final List<Tasks> tasks;
  CustomListView(this.tasks);
  @override
  _CustomListViewState createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        return TaskListTile(
            isChecked: widget.tasks[index].isDone,
            taskTitle: widget.tasks[index].name,
            checkboxCallback: (checkBoxState) {
              setState(() {
                widget.tasks[index].toggle();
              });
            });
      },
    );
  }
}
