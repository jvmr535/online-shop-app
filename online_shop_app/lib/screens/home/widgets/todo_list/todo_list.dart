import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required List<String> todoList,
  }) : _todoList = todoList;

  final List<String> _todoList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Card(
          child: ListView.builder(
            itemCount: _todoList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_todoList[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
