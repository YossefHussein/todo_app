import 'package:flutter/material.dart';
import 'package:todo_app/shared/widget/build_task_item.dart';

import '../shared/components/constant.dart';

class NewTaskModule extends StatelessWidget {
  const NewTaskModule({Key key}) : super(key: key);
// this for new task
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => buildTaskItem(taskNumber: index, model: tasks[index]),
      separatorBuilder: (context, index) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 1,
        color: Colors.grey,
      ),
      itemCount: tasks.length,
    );
  }
}
