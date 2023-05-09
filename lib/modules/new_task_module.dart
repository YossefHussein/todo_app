import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/shared/bloc/app_cubit.dart';
import 'package:todo_app/shared/bloc/states.dart';
import '../shared/components/components.dart';
import '../shared/translations/locale_keys.dart';

class NewTaskModule extends StatelessWidget {
  const NewTaskModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        // for see on doneTasks
        var tasks = AppCubit.get(context).newTasks;
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
                  '${LocaleKeys.noTasksYet.tr().toUpperCase()}',
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
              // you see all task in newTasks by index
              // index looping on all item in newTasks and add to screen
              model: tasks[index], context: context,
            ),
            itemCount: tasks.length,
          ),
        );
      },
    );
  }
}
