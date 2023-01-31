// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/shared/widget/build_task_item/build_task_item.dart';

class NewTaskModule extends StatelessWidget {
  const NewTaskModule({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => buildTaskItem(index),
        separatorBuilder: (context, index) => Container(
          height: 1,
          color: Colors.grey,
          ),
        itemCount: 15,
      );
  }
}
