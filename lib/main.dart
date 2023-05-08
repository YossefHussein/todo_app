import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/shared/bloc/my_bloc_observer.dart';
import 'package:todo_app/shared/translations/codegen_loader.g.dart';
import 'layout/home_layout.dart';

void main() async {
  // this  use is when convert main function to async
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // this you call bloc observer
  // to see the all movement of states
  Bloc.observer = MyBlocObserver();
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: [
        Locale('ar'),
        Locale('en'),
        Locale('es'),
        Locale('fr'),
      ],
      fallbackLocale: Locale('ar'),
      assetLoader: CodegenLoader(),
      child: HomeLayout(),
    ),
  );
}
