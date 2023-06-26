import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list_app/screens/home/home_screen.dart';
import 'package:todo_list_app/screens/register/register_screen.dart';
import 'package:todo_list_app/services/auth_service/auth_service.dart';
import 'package:todo_list_app/widgets/text_field_with_icon/text_field_with_icon.dart';
import 'package:todo_list_app/stores/login/login_store.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    LoginStore loginStore = LoginStore();
    final authService = GetIt.instance<AuthService>();

    handleSubmit() async {
      await authService.signInWithEmailAndPassword(
        loginStore.email,
        loginStore.password,
      );
    }

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              child: TextFieldWithIcon(
                prefixIcon: Icons.person_2_rounded,
                labelText: 'E-mail',
                onChanged: loginStore.setEmail,
                isPassword: false,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: TextFieldWithIcon(
                prefixIcon: Icons.lock,
                labelText: 'Senha',
                onChanged: loginStore.setPassword,
                isPassword: true,
              ),
            ),
            const SizedBox(height: 16),
            Observer(
              builder: (_) {
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                    ),
                    onPressed: loginStore.isFormValid
                        ? () async {
                            try {
                              await handleSubmit();
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            } catch (error) {
                              log(error.toString());
                            }
                          }
                        : null,
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Observer(
              builder: (_) {
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                    ),
                    onPressed: () async {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Cadastro',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
