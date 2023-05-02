import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/shared/bloc/states.dart';

import '../shared/bloc/app_cubit.dart';
import '../shared/components/components.dart';
import '../shared/components/constant.dart';

class DoneTaskModule extends StatelessWidget {
  const DoneTaskModule({Key? key}) : super(key: key);

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
          fallback: (context) => Center(child: Text('In new version'),)
        );
      },
    );
  }
}
