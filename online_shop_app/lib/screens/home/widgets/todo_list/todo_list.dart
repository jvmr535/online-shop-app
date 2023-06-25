import 'package:flutter/material.dart';
import 'package:todo_list_app/models/todo_item/todo_item_model.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key, required List<TodoItem> todoList})
      : _todoList = todoList,
        super(key: key);

  final List<TodoItem> _todoList;

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListView.separated(
        itemCount: widget._todoList.length,
        separatorBuilder: (context, index) => SizedBox(
          height: 1,
          child: Divider(
            color: Colors.grey[400],
          ),
        ),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              widget._todoList[index].title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                decoration: widget._todoList[index].done
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.deepPurple,
              child: Text(
                widget._todoList[index].title[0],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            trailing: Checkbox(
              value: widget._todoList[index].done,
              onChanged: (value) async {},
            ),
          );
        },
      ),
    );
  }
}
