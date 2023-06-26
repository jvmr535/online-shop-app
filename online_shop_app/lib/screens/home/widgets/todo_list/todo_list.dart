import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_app/models/todo_item/todo_item_model.dart';
import 'package:todo_list_app/screens/home/widgets/circle_avatar_todo_item/circle_avatar_todo_item.dart';
import 'package:todo_list_app/screens/home/widgets/options_row/options_row.dart';
import 'package:todo_list_app/screens/home/widgets/text_todo_item/text_todo_item.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final prefs = GetIt.I.get<SharedPreferences>();
  late final String userId;

  late DatabaseReference firebaseInstance;

  @override
  void initState() {
    super.initState();
    userId = GetIt.I.get<SharedPreferences>().getString('uid') as String;
    firebaseInstance = FirebaseDatabase.instance.ref("users/$userId/todoList");
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: StreamBuilder(
        stream: firebaseInstance.onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemCount: snapshot.data!.snapshot.children.length,
              separatorBuilder: (context, index) =>
                  const Divider(), // Add the divider
              itemBuilder: (context, index) {
                final todoList = <TodoItem>[];
                final todoItemList = snapshot.data?.snapshot.value as Map;
                todoItemList.forEach((key, value) {
                  todoList.add(
                    TodoItem(
                      key: key,
                      title: value['title'],
                      done: value['done'],
                    ),
                  );
                });
                return ListTile(
                  title: TextTodoItem(todoList: todoList, index: index),
                  leading:
                      CircleAvatarTodoItem(todoList: todoList, index: index),
                  trailing: OptionsRow(
                    todoList: todoList,
                    firebaseInstance: firebaseInstance,
                    index: index,
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
