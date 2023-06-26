import 'package:flutter/material.dart';
import 'package:todo_list_app/models/todo_item/todo_item_model.dart';

class CircleAvatarTodoItem extends StatelessWidget {
  const CircleAvatarTodoItem({
    super.key,
    required this.todoList,
    required this.index,
  });

  final List<TodoItem> todoList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.deepPurple,
      child: Text(
        todoList[index].title[0],
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
