import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/shared/bloc/my_bloc_observer.dart';

import 'layout/home_layout.dart';
import 'shared/bloc/app_cubit.dart';
import 'shared/bloc/states.dart';
import 'shared/components/constant.dart';
import 'shared/styles/color.dart';

void main() {
  // this you call bloc observer
  // to see the all movement of states
  Bloc.observer = MyBlocObserver();
  runApp(HomeLayout());
}
