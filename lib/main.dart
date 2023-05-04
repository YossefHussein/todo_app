import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/shared/bloc/my_bloc_observer.dart';
import 'layout/home_layout.dart';

void main() {
  // this you call bloc observer 
  // to see the all movement of states 
  Bloc.observer = MyBlocObserver();
  runApp(HomeLayout());
}
