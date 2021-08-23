import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  AddTask({required this.addTaskCallBack});
  final Function addTaskCallBack;

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    return Container(
        color: Color(0xff757575),
        child: Container(
            padding: EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700),
                ),
                TextField(
                  autofocus: true,
                  onChanged: (value) {
                    newTaskTitle = value;
                  },
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 3.0),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      addTaskCallBack(newTaskTitle);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.lightBlueAccent),
                    ),
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            )));
  }
}
