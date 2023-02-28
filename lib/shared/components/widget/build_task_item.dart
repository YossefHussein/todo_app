import 'package:flutter/material.dart';
import 'package:todo_app/shared/components/constant.dart';

Widget buildTaskItem({int taskNumber, Map model}) {
  return Padding(
    padding: const EdgeInsets.all(pPadding),
    child: Row(
      children: [
        CircleAvatar(
          radius: 40,
          child: Text(
            '${model['time']}',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.purple,
        ),
        SizedBox(width: 20),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${taskNumber + 1}: ${model['title']}',
            ),
            Text(
              '${model['date']}',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    ),
  );
}
