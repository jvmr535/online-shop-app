import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list_app/models/todo_item/todo_item_model.dart';
import 'package:todo_list_app/screens/home/widgets/add_on_todo_list_bar/add_on_todo_list_bar.dart';
import 'package:todo_list_app/screens/home/widgets/todo_list/todo_list.dart';
import 'package:todo_list_app/screens/login/login_screen.dart';
import 'package:todo_list_app/services/auth_service/auth_service.dart';
import 'package:todo_list_app/services/todo_list_service/todo_list_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final authService = GetIt.I.get<AuthService>();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () async {
              try {
                await authService.signOut();
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
      body: Observer(builder: (_) {
        return FutureBuilder<List<TodoItem>>(
          future: TodoListService().getTodoList(),
          builder: (context, snapshot) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const AddOnTodoListBar(),
                  const SizedBox(height: 16),
                  Expanded(
                    child: snapshot.connectionState == ConnectionState.waiting
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : const TodoList(),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
