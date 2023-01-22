import 'package:flutter/material.dart';

Widget defaultFormField({
  @required TextEditingController controller,
  @required String label,
  String hint,
  String helper,
  bool isPassword = false,
  // that is validation message
  @required FormFieldValidator<String> validMsg,
  ValueChanged<String> onSubmits,
  ValueChanged<String> onChanged,
  @required TextInputType type,
  @required Widget prefixIcon,
  Function onTap,
  Widget suffixIcon,
  Color suffixIconColor,
  Color prefixIconColor,
  VoidCallback suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmits,
      onChanged: onChanged,
      obscureText: isPassword,
      onTap: onTap,
      decoration: InputDecoration(
        prefixIconColor: prefixIconColor,
        suffixIconColor: suffixIconColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon != null? IconButton(onPressed: suffixPressed, icon: suffixIcon) : null,
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white),
        helperText: helper,
        helperStyle: const TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      validator: validMsg,
    );
