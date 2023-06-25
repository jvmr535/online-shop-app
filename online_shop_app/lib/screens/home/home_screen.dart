import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_list_app/models/todo_item/todo_item.dart';
import 'package:todo_list_app/screens/home/widgets/add_on_todo_list_bar/add_on_todo_list_bar.dart';
import 'package:todo_list_app/screens/home/widgets/todo_list/todo_list.dart';
import 'package:todo_list_app/screens/login/login_screen.dart';
import 'package:todo_list_app/services/auth_service/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<TodoItem> _todoList = [
    TodoItem(title: "Fazer compras", done: false),
    TodoItem(title: "Polir o chifre", done: true),
    TodoItem(title: "Estudar flutter", done: false),
    TodoItem(title: "Ouvir música de corno", done: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              try {
                await Auth().signOut();

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              } catch (error) {
                log(error.toString());
              }
            },
            icon: const Icon(Icons.logout),
          ),
        ],
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text(
          "Lista de afazeres",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AddOnTodoListBar(),
              const SizedBox(height: 16),
              Expanded(
                child: TodoList(todoList: _todoList),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
