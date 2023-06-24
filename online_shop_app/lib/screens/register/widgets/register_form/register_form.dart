import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_list_app/screens/login/login_screen.dart';
import 'package:todo_list_app/services/auth/auth_service.dart';
import 'package:todo_list_app/stores/register/register_store/register_store.dart';
import 'package:todo_list_app/widgets/text_field_with_icon/text_field_with_icon.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  RegisterStore registerStore = RegisterStore();

  handleSubmit() async {
    if (registerStore.isFormValid) {
      await Auth().registerWithEmailAndPassword(
        registerStore.email,
        registerStore.password,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                onChanged: registerStore.setEmail,
                isPassword: false,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: TextFieldWithIcon(
                prefixIcon: Icons.lock,
                labelText: 'Senha',
                onChanged: registerStore.setPassword,
                isPassword: true,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: TextFieldWithIcon(
                prefixIcon: Icons.lock,
                labelText: 'Confirmar senha',
                onChanged: registerStore.setConfirmPassword,
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
                    onPressed: registerStore.isFormValid
                        ? () async {
                            await handleSubmit();
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          }
                        : null,
                    child: const Text(
                      'Cadastrar',
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
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Voltar',
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
