import 'package:flutter/material.dart';
import 'package:to_doof/src/widgets/tasks_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 50.0),
      children: [
        TaskTile(),
        TaskTile(),
      ],
    );
  }
}
