import 'package:flutter/material.dart';

class TextFieldWithIcon extends StatefulWidget {
  final IconData prefixIcon;
  final String labelText;
  final void Function(String) onChanged;
  final bool isPassword;

  const TextFieldWithIcon({
    Key? key,
    required this.prefixIcon,
    required this.labelText,
    required this.onChanged,
    required this.isPassword,
  }) : super(key: key);

  @override
  TextFieldWithIconState createState() => TextFieldWithIconState();
}

class TextFieldWithIconState extends State<TextFieldWithIcon> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isPassword ? obscureText : false,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.3),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.white),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            widget.prefixIcon,
            size: 20,
            color: Colors.white,
          ),
        ),
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: Colors.white),
        suffixIcon: widget.isPassword
            ? Padding(
                padding: const EdgeInsets.all(5),
                child: IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(
                      () {
                        obscureText = !obscureText;
                      },
                    );
                  },
                ),
              )
            : null,
      ),
      onChanged: widget.onChanged,
    );
  }
}
