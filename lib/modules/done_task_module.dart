import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/shared/bloc/states.dart';

import '../shared/bloc/app_cubit.dart';
import '../shared/components/components.dart';

class DoneTaskModule extends StatelessWidget {
  const DoneTaskModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        // for see on doneTasks
        var tasks = AppCubit.get(context).doneTasks;
        return ConditionalBuilder(
          // if the tasks under zero see no tasks message
          condition: tasks.isNotEmpty,
          fallback: (context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.list,
                  size: 150,
                  color: Colors.grey,
                ),
                Text(
                  'No Tasks Yet, Please Add Some Tasks',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          builder: (context) => ListView.builder(
            itemBuilder: (context, index) => buildTaskItem(
              taskNumber: index,
              // you see all task in doneTasks by index
              // index looping on all item in doneTasks and add to screen
              model: tasks[index],
              context: context,
            ),
 
            itemCount: tasks.length,
          ),
        );
      },
    );
  }
}
