import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final Function(String value) onChanged;
  final bool? obscureText;
  final String hintText;

  const MyTextFormField({
    Key? key,
    required this.onChanged,
    this.obscureText,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 40,
      child: TextFormField(
        onChanged: onChanged,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          // isDense: true,
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: theme.colorScheme.primary),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.colorScheme.primary),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 10.0,
          ),
        ),
        style: obscureText != null ? const TextStyle(fontFamily: 'roboto') : null,
      ),
    );
  }
}
