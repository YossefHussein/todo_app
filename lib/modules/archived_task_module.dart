import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/bloc/app_cubit.dart';
import '../shared/bloc/states.dart';
import '../shared/components/components.dart';

class ArchivedTaskModule extends StatelessWidget {
  const ArchivedTaskModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        // for see on archivedTasks
        var tasks = AppCubit.get(context).archivedTasks;
        return taskConditionBuilder(tasks: tasks);
      },
    );
  }
}
