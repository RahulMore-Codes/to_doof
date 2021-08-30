import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_doof/src/model/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen(this.addTaskController);

  final TextEditingController addTaskController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Write your task here",
              ),
              onChanged: (value) => addTaskController.text = value,
            ),
            SizedBox(height: 5.0),
            TextButton(
              child: Text(
                "ADD",
                style: TextStyle(color: Theme.of(context).backgroundColor),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                final String newTaskTitle = addTaskController.text;
                if (newTaskTitle != null || newTaskTitle != "") {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newTaskTitle);
                }
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
