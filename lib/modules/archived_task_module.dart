import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/bloc/app_cubit.dart';
import '../shared/bloc/states.dart';
import '../shared/components/components.dart';

class ArchivedTaskModule extends StatefulWidget {
  const ArchivedTaskModule({Key? key}) : super(key: key);

  @override
  State<ArchivedTaskModule> createState() => _ArchivedTaskModuleState();
}

class _ArchivedTaskModuleState extends State<ArchivedTaskModule> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: taskConditionBuilder(
            tasks: AppCubit.get(context).archivedTasks,
          ),
        );
      },
    );
  }
}
