import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_list_app/screens/home/widgets/add_on_todo_list_bar/add_on_todo_list_bar.dart';
import 'package:todo_list_app/screens/home/widgets/todo_list/todo_list.dart';
import 'package:todo_list_app/screens/login/login_screen.dart';
import 'package:todo_list_app/services/auth/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _todoList = ['Tarefa 1', 'Tarefa 2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () async {
              try {
                await Auth().signOut();
                // ignore: use_build_context_synchronously
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
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AddOnTodoListBar(),
          const SizedBox(height: 16),
          TodoList(todoList: _todoList),
        ],
      ),
    );
  }
}
