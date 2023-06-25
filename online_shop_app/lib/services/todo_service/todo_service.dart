import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_app/models/todo_item/todo_item.dart';

class Todo {
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createTodoItem(TodoItem todoItem) async {
    final prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString('uid');
    ref.child('users').child(uid!).child('todoList').push().set({
      'title': todoItem.title,
      'done': todoItem.done,
    });
  }
}
