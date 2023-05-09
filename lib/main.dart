import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/shared/bloc/app_cubit.dart';
import 'package:todo_app/shared/bloc/my_bloc_observer.dart';
import 'package:todo_app/shared/translations/codegen_loader.g.dart';
import 'layout/home_layout.dart';
import 'shared/bloc/states.dart';
import 'shared/components/constant.dart';
import 'shared/styles/color.dart';
import 'shared/translations/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';

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
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            // theme of app
            theme: ThemeData(
              scaffoldBackgroundColor: pScaffoldBackgroundColor,
              appBarTheme: AppBarTheme(
                centerTitle: true,
                elevation: 0,
                backgroundColor: pAppBarBackgroundColor,
                titleTextStyle: TextStyle(
                  color: pColor,
                  fontSize: 30,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                enableFeedback: true,
                backgroundColor: pBottomNavigationBarColor,
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                enableFeedback: true,
              ),
              bottomSheetTheme: BottomSheetThemeData(
                backgroundColor: pBottomSheetColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(pBorderRadius * 2),
                    topRight: Radius.circular(pBorderRadius * 2),
                  ),
                ),
              ),
              colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: pColor,
                secondary: sColor,
              ),
            ),
            title: 'todo',
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            // main app widgets
            home: HomeLayout(),
          );
        },
      ),
    );
  }
}
