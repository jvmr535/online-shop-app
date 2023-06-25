import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_list_app/models/todo_item/todo_item_model.dart';
import 'package:todo_list_app/services/todo_list_service/todo_list_service.dart';
import 'package:todo_list_app/stores/todo_item/todo_item_store.dart';

class AddOnTodoListBar extends StatefulWidget {
  const AddOnTodoListBar({
    Key? key,
  }) : super(key: key);

  @override
  State<AddOnTodoListBar> createState() => _AddOnTodoListBarState();
}

class _AddOnTodoListBarState extends State<AddOnTodoListBar> {
  TodoItemStore todoItemStore = TodoItemStore();

  void handleCreateTodoItem() async {
    try {
      await TodoListService()
          .createTodoItem(
            TodoItem(
              title: todoItemStore.title,
              done: false,
            ),
          )
          .then(
            (value) => log(
              "Item adicionado com sucesso!!",
            ),
          );
    } catch (error) {
      log(
        error.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: todoItemStore.setTitle,
      style: const TextStyle(
        fontSize: 16,
      ),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: 'Adicionar na lista',
        hintStyle: TextStyle(
          color: Colors.grey[400],
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.add),
          onPressed: handleCreateTodoItem,
        ),
      ),
    );
  }
}
