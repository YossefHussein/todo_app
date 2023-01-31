import 'package:flutter/material.dart';

Widget buildTaskItem(index) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.purple,
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Task title ${index + 1}",
            ),
            Text(
              "2 april 2023",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    ),
  );
}
