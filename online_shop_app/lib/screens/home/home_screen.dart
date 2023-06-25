import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/models/todo_item/todo_item_model.dart';
import 'package:todo_list_app/screens/home/widgets/add_on_todo_list_bar/add_on_todo_list_bar.dart';
import 'package:todo_list_app/screens/home/widgets/todo_list/todo_list.dart';
import 'package:todo_list_app/screens/login/login_screen.dart';
import 'package:todo_list_app/services/auth_service/auth_service.dart';
import 'package:todo_list_app/services/todo_list_service/todo_list_service.dart';
import 'package:todo_list_app/stores/todo_item/todo_item_store.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    TodoItemStore todoItems = Provider.of<TodoItemStore>(context);

    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              try {
                await AuthService().signOut();
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
        final List<TodoItem> todoList = todoItems.todoList;
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
                        : TodoList(
                            todoList: todoList.isEmpty
                                ? snapshot.data ?? []
                                : todoList,
                          ),
                  ),
                  // ElevatedButton(
                  //   onPressed: () async {
                  //     await TodoListService().getTodoList();
                  //   },
                  //   child: const Text("Exibir"),
                  // ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
