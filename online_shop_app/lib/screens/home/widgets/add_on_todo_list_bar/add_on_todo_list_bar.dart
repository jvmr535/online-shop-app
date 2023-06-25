import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_list_app/models/todo_item/todo_item.dart';
import 'package:todo_list_app/services/todo_service/todo_service.dart';

class AddOnTodoListBar extends StatelessWidget {
  const AddOnTodoListBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void handleCreateTodoItem() async {
      try {
        await Todo().createTodoItem(TodoItem(title: "Teste", done: true)).then(
              (value) => log("Deu certo!!"),
            );
      } catch (error) {
        log(error.toString());
      }
      // Add your logic here for handling the add button press
    }

    return TextField(
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
