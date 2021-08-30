import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:to_doof/src/model/task_data.dart';
import 'package:to_doof/src/screens/tasks_screen.dart';

void main() {
  //Make app view Portrait only
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        title: "To-Doof",
        theme: ThemeData(
          primaryColor: Colors.lightBlueAccent,
          backgroundColor: Colors.white,
        ),
        home: TasksScreen(),
      ),
    );
  }
}
