import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_app/models/todo_item/todo_item_model.dart';

class TodoListService {
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  Future<void> createTodoItem(TodoItem todoItem) async {
    final prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString('uid');
    ref
        .child('users')
        .child(uid!)
        .child('todoList')
        .push()
        .set(todoItem.toJson());
  }

  Future<List<TodoItem>> getTodoList() async {
    final prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString('uid');

    if (uid == null) return <TodoItem>[];

    final databaseEvent =
        await FirebaseDatabase.instance.ref("users/$uid/todoList").get();

    List<TodoItem> todoList = [];

    final todoItems = databaseEvent.children;

    for (var todoItem in todoItems) {
      Map<dynamic, dynamic> data = todoItem.value! as Map<dynamic, dynamic>;
      String title = data["title"] as String;
      bool done = data["done"] as bool;

      todoList.add(TodoItem(title: title, done: done));
    }

    return todoList;
  }
}
