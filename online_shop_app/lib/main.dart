import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_list_app/screens/home/home_screen.dart';
import 'package:todo_list_app/screens/login/login_screen.dart';
import 'package:todo_list_app/services/auth_service/auth_service.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MobX Tutorial',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AuthService().currentUser == null
          ? const HomeScreen()
          : const LoginScreen(),
    );
  }
}
