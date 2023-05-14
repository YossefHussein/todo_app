import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/shared/bloc/app_cubit.dart';
import 'package:todo_app/shared/bloc/states.dart';
import '../shared/components/components.dart';

class NewTaskModule extends StatefulWidget {
  const NewTaskModule({Key? key}) : super(key: key);

  @override
  State<NewTaskModule> createState() => _NewTaskModuleState();
}

class _NewTaskModuleState extends State<NewTaskModule> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        // for see on doneTasks
        var tasks = AppCubit.get(context).newTasks;
        return taskConditionBuilder(tasks:tasks);
      },
    );
  }
}
