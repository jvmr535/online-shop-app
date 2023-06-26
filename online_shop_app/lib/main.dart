import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_list_app/dependency_injection.dart';
import 'package:todo_list_app/screens/home/home_screen.dart';
import 'package:todo_list_app/screens/login/login_screen.dart';
import 'package:todo_list_app/services/auth_service/auth_service.dart';
import 'package:get_it/get_it.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final di = DependencyInjection();
  await di.init();

  final getIt = GetIt.instance;
  final authService = getIt<AuthService>();

  final initApp = await authService.getCurrentUser() == null
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
