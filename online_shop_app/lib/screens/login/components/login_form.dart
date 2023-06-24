import 'package:flutter/material.dart';
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
              child: _TextFieldWithIcon(
                prefixIcon: Icons.person_2_rounded,
                labelText: 'E-mail',
                onChanged: loginStore.setEmail,
                isPassword: false,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: _TextFieldWithIcon(
                prefixIcon: Icons.lock,
                labelText: 'Senha',
                onChanged: loginStore.setPassword,
                isPassword: true,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
              ),
              onPressed: () {
                print(loginStore.email);
                print(loginStore.password);
              },
              child: const Text('Login', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class _TextFieldWithIcon extends StatefulWidget {
  final IconData prefixIcon;
  final String labelText;
  final void Function(String) onChanged;
  final bool isPassword;

  const _TextFieldWithIcon({
    Key? key,
    required this.prefixIcon,
    required this.labelText,
    required this.onChanged,
    this.isPassword = false,
  }) : super(key: key);

  @override
  _TextFieldWithIconState createState() => _TextFieldWithIconState();
}

class _TextFieldWithIconState extends State<_TextFieldWithIcon> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isPassword ? obscureText : false,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black.withOpacity(0.1), // Lighter background color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
              color: Colors.white.withOpacity(0.3)), // Lighter border color
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
              color: Colors.white), // Darker border color when focused
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Icon(
              widget.prefixIcon,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: Colors.white),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              )
            : null,
      ),
      onChanged: widget.onChanged,
    );
  }
}
