import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key,this.hintText, this.inputType,this.onChanged, this.obscureText = false});

  Function(String)? onChanged;
  String? hintText;
  TextInputType? inputType;

  bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      obscureText: obscureText!,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(18),
        ),
        border: OutlineInputBorder(
            borderSide: const BorderSide(), borderRadius: BorderRadius.circular(18)),
      ),
    );
  }
}
