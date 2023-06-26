import 'package:flutter/material.dart';
import 'package:todo_list_app/models/todo_item/todo_item_model.dart';

class TextTodoItem extends StatelessWidget {
  const TextTodoItem({
    super.key,
    required this.index,
    required this.todoList,
  });

  final List<TodoItem> todoList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Text(
      todoList[index].title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        decoration: todoList[index].done
            ? TextDecoration.lineThrough
            : TextDecoration.none,
      ),
    );
  }
}
