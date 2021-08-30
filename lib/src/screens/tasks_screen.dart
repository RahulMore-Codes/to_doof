import 'package:flutter/material.dart';
import 'package:to_doof/src/model/task_data.dart';
import 'package:to_doof/src/screens/add_task_screen.dart';
import 'package:to_doof/src/widgets/tasks_list.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  TextEditingController addTaskController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    color: Theme.of(context).primaryColor,
                    size: 30.0,
                  ),
                  radius: 30.0,
                  backgroundColor: Theme.of(context).backgroundColor,
                ),
                SizedBox(height: 10.0),
                Text(
                  "To-DooF",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "${Provider.of<TaskData>(context).taskCount} Tasks",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: TasksList(),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: (context) => AddTaskScreen(addTaskController),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
