import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:online_shop_app/components/text_field_with_icon/text_field_with_icon.dart';
import 'package:online_shop_app/screens/home/home_screen.dart';
import 'package:online_shop_app/stores/login/login_store.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  LoginStore loginStore = LoginStore();

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
                    onPressed: isLoginValid.isFormValid
                        ? () {
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(
                                title: "Aplicativo Teste",
                              ),
                            );
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
          ],
        ),
      ),
    );
  }

  LoginStore get isLoginValid => loginStore;
}
