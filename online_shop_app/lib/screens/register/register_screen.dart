import 'package:flutter/material.dart';
import 'package:todo_list_app/screens/register/widgets/register_form/register_form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: RegisterForm(),
      ),
    );
  }
}
