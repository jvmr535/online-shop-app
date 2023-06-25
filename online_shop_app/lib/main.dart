import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/screens/home/home_screen.dart';
import 'package:todo_list_app/screens/login/login_screen.dart';
import 'package:todo_list_app/services/auth_service/auth_service.dart';
import 'package:todo_list_app/stores/login/login_store.dart';
import 'package:todo_list_app/stores/register/register_store/register_store.dart';
import 'package:todo_list_app/stores/todo_item/todo_item_store.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final initApp = await AuthService().getCurrentUser() != null
      ? const LoginScreen()
      : const HomeScreen();

  runApp(
    MultiProvider(
      providers: [
        Provider<LoginStore>(create: (_) => LoginStore()),
        Provider<RegisterStore>(create: (_) => RegisterStore()),
        Provider<TodoItemStore>(create: (_) => TodoItemStore()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MobX Tutorial',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: initApp),
    ),
  );
}
