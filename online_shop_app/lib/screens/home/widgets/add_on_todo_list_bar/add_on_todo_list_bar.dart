import 'package:flutter/material.dart';

class AddOnTodoListBar extends StatelessWidget {
  const AddOnTodoListBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(5),
            child: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {},
            ),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: 'Adicionar na lista',
        ),
      ),
    );
  }
}
