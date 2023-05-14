
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
        return taskConditionBuilder(tasks:tasks);
      },
    );
  }
}
