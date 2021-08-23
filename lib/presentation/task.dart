import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todo_list/presentation/add_task.dart';
import 'package:todo_list/presentation/modal/tasks.dart';
import 'package:todo_list/presentation/widget/task_list.dart';

class Task extends StatefulWidget {
  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  List<Tasks> tasks = [
    Tasks(name: 'Monday'),
    Tasks(name: 'Tuesday'),
    Tasks(name: 'Wednesday'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom),
                  child: AddTask(
                    addTaskCallBack: (value) {
                      setState(() {
                        tasks.add(Tasks(name: value));
                        print(value);
                      });
                      Navigator.pop(context);
                    },
                  )));
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 60.0, left: 30.0, bottom: 30.0, right: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    child: Icon(
                      Icons.list,
                      size: 30.0,
                      color: Colors.lightBlueAccent,
                    ),
                    backgroundColor: Colors.white,
                    radius: 30.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('Todo List',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                        fontWeight: FontWeight.w700,
                      )),
                  Text('$tasks Task',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    //child: CustomListView(),
                    child: CustomListView(tasks),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
