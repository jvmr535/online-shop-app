import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/models/todo_item/todo_item_model.dart';

class OptionsRow extends StatelessWidget {
  const OptionsRow({
    super.key,
    required this.todoList,
    required this.firebaseInstance,
    required this.index,
  });

  final List<TodoItem> todoList;
  final DatabaseReference firebaseInstance;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: todoList[index].done,
          onChanged: (value) async {
            await firebaseInstance
                .child(todoList[index].key as String)
                .update({'done': !todoList[index].done});
          },
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            // Handle delete functionality here
            // Example: Delete the item from the Firebase database
            firebaseInstance.child(todoList[index].key as String).remove();
          },
        ),
      ],
    );
  }
}
