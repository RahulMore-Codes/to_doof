import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkBoxState;
  final Function onLongPressCallback;

  TaskTile(
      {this.isChecked,
      this.taskTitle,
      this.checkBoxState,
      this.onLongPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: checkBoxState,
      ),
      onLongPress: onLongPressCallback,
    );
  }
}
