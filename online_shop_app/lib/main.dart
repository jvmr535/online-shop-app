import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_list_app/dependency_injection.dart';
import 'package:todo_list_app/screens/home/home_screen.dart';
import 'package:todo_list_app/screens/login/login_screen.dart';
import 'package:todo_list_app/services/auth_service/auth_service.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await DependencyInjection().init();

  final initApp = await AuthService().getCurrentUser() != null
      ? const LoginScreen()
      : const HomeScreen();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MobX Tutorial',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: initApp,
    ),
  );
}
