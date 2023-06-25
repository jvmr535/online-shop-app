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

    final databaseReference =
        await FirebaseDatabase.instance.ref("users/$uid/todoList").get();

    return databaseReference.children
        .map(
          (todoItem) {
            final item = todoItem.value as Map;
            return TodoItem(
              key: todoItem.key,
              title: item['title'],
              done: item['done'],
            );
          },
        )
        .toList()
        .reversed
        .toList();
  }

  // Future<void> updateTodoItem(TodoItem todoItem) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final uid = prefs.getString('uid');
  //   ref
  //       .child('users')
  //       .child(uid!)
  //       .child('todoList')
  //       .child(todoItem.key)
  //       .update(todoItem.toJson());
  // }
}
