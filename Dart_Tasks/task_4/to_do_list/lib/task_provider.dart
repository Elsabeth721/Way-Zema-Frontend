import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
 void updateTask(Task oldTask, Task newTask) {
    int index = _tasks.indexOf(oldTask);
    _tasks[index] = newTask;
    notifyListeners();
  }
}
