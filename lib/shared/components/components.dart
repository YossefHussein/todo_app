import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todo_app/shared/components/constant.dart';
import 'package:todo_app/shared/styles/color.dart';

/// to make task item
Widget buildTaskItem({required int taskNumber, Map? model}) => Padding(
      padding: const EdgeInsets.all(pPadding),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            // time of task
            child: Text(
              '${model!['time']}',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: sColor,
          ),
          SizedBox(width: 20),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title of task
              Text(
                '${taskNumber + 1}: ${model['title']}',
              ),
              // date of task
              Text(
                '${model['date']}',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );

/// this is default formField in my application
Widget defaultFormField({
  required TextEditingController controller,
  required String label,
  String? hint,
  String? helper,
  bool isPassword = false,
  // that is validation message
  required FormFieldValidator<String> validMsg,
  required TextInputType type,
  required Widget prefixIcon,
  required Function()? onTap,
  Widget? suffixIcon,
  Color? suffixIconColor,
  Color? prefixIconColor,
  bool? disableKeyBoard = false,
  VoidCallback? suffixPressed,
}) =>
    TextFormField(
      showCursor: disableKeyBoard,
      readOnly: disableKeyBoard!,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onTap: () {
        onTap!();
      },
      decoration: InputDecoration(
        prefixIconColor: prefixIconColor,
        suffixIconColor: suffixIconColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon != null
            ? IconButton(onPressed: suffixPressed, icon: suffixIcon)
            : null,
        labelText: label,
        hintText: hint,
        helperText: helper,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      validator: validMsg,
    );
