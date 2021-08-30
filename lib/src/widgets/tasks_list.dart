import 'package:flutter/material.dart';
import 'package:to_doof/src/model/task_data.dart';
import 'package:to_doof/src/widgets/tasks_tile.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return (taskData.tasks.length > 0)
            ? ListView.builder(
                padding: EdgeInsets.only(bottom: 80.0),
                itemCount: taskData.taskCount,
                itemBuilder: (context, index) {
                  final task = taskData.tasks[index];
                  return TaskTile(
                    taskTitle: task.taskName,
                    isChecked: task.isDone,
                    checkBoxState: (state) => taskData.updateTask(task),
                    onLongPressCallback: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Delete Task?"),
                        content: Text(task.taskName),
                        actions: [
                          TextButton(
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                          TextButton(
                            child: Text(
                              "Delete",
                              style: TextStyle(color: Colors.red),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                            ),
                            onPressed: () {
                              //delete the task
                              taskData.deleteTask(task);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: Text(
                  "Add Tasks",
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              );
      },
    );
  }
}
