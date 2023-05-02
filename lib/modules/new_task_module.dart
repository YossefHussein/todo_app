import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/shared/bloc/app_cubit.dart';
import 'package:todo_app/shared/bloc/states.dart';
import '../shared/components/constant.dart';
import '../shared/components/components.dart';

class NewTaskModule extends StatelessWidget {
  const NewTaskModule({Key? key}) : super(key: key);
  // this for new task
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).tasks;
        return ConditionalBuilder(
          condition: tasks.isEmpty,
          builder: (context) => Center(
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
                  'Please add task form FAB button',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          fallback: (context) => ListView.separated(
            itemBuilder: (context, index) => buildTaskItem(
              taskNumber: index,
              model: tasks[index],
            ),
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsetsDirectional.only(
                start: pPadding + 20,
                end: pPadding + 20,
              ),
              child: Container(
                height: 1,
                color: Colors.grey,
              ),
            ),
            itemCount: tasks.length,
          ),
        );
      },
    );
  }
}
