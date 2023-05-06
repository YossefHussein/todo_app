import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/shared/bloc/app_cubit.dart';

import '../shared/bloc/states.dart';
import '../shared/components/components.dart';
import '../shared/components/constant.dart';
import '../shared/styles/color.dart';

// ignore: must_be_immutable
class HomeLayout extends StatelessWidget {
  HomeLayout({Key? key}) : super(key: key);

  // this is for see bottomSheet
  // ScaffoldState
  var scaffoldKey = GlobalKey<ScaffoldState>();

  // this use for validation
  // 'FormState' this type of 'GlobalKey'
  var formKey = GlobalKey<FormState>();

  // controllers
  // this use for insert values of controllers
  // to database of todo app
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          if (state is AppInsertDatabaseState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return MaterialApp(
            // theme
            theme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: pScaffoldBackgroundColor,
              appBarTheme: AppBarTheme(
                centerTitle: true,
                color: pColor,
                foregroundColor: pTextAppBarColor,
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: pColor,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                backgroundColor: pBottomNavigationBarColor,
                elevation: 20,
              ),
              bottomSheetTheme: BottomSheetThemeData(
                // backgroundColor: pBottomSheetColor,
                elevation: 20,
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
            // main app widgets
            home: Scaffold(
              // this to bottom sheet
              // for see in screen
              key: scaffoldKey,
              appBar: AppBar(
                // when click on any scree change the appBar to name his screen
                title: Text(cubit.title[cubit.currentIndex]),
              ),
              body: ConditionalBuilder(
                condition: true,
                builder: (BuildContext context) =>
                    cubit.screen[cubit.currentIndex],
                fallback: (BuildContext context) => Center(
                  child: CircularProgressIndicator(
                    color: pColor,
                    strokeWidth: 5,
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  // if bottom sheet shown from user
                  if (cubit.isBottomSheetShown) {
                    // doing validation on defaultFormField
                    if (formKey.currentState!.validate()) {
                      cubit.insertToDatabase(
                        // give data from controller to database
                        title: titleController.text,
                        date: dateController.text,
                        time: timeController.text,
                      );
                    }
                  } else {
                    scaffoldKey.currentState!
                        .showBottomSheet(
                          (context) => SingleChildScrollView(
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      // this task title formField
                                      defaultFormField(
                                          controller: titleController,
                                          type: TextInputType.text,
                                          // this is validation
                                          validMsg: (value) {
                                            // if the formField empty see validation
                                            if (value!.isEmpty) {
                                              return "Title Can't be Empty";
                                            }
                                            return null;
                                          },
                                          onTap: () {
                                            print(timeController.toString());
                                          },
                                          label: "Task Title",
                                          prefixIcon: Icon(Icons.title)),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      // this task time formField
                                      defaultFormField(
                                        disableKeyBoard: true,
                                        controller: timeController,
                                        type: TextInputType.datetime,
                                        validMsg: (value) {
                                          if (value!.isEmpty) {
                                            return "Time Can't be Empty";
                                          }
                                          return null;
                                        },
                                        onTap: () {
                                          showTimePicker(
                                                  context: context,
                                                  initialTime: TimeOfDay.now())
                                              .then((value) {
                                            timeController.text = value!
                                                .format(context)
                                                .toString();

                                            print(value.format(context));
                                          });
                                        },
                                        label: "Task Time",
                                        prefixIcon:
                                            Icon(Icons.watch_later_rounded),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      defaultFormField(
                                        disableKeyBoard: true,
                                        controller: dateController,
                                        type: TextInputType.datetime,
                                        validMsg: (value) {
                                          if (value!.isEmpty) {
                                            return "Date Can't be Empty";
                                          }
                                          return null;
                                        },
                                        onTap: () {
                                          showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate:
                                                DateTime.parse('2100-01-01'),
                                          ).then((value) {
                                            // equal the value getting from "showDatePicker" to timeController
                                            dateController.text =
                                                DateFormat.yMMMEd()
                                                    .format(value!);
                                          }).catchError((error) {
                                            print(
                                                'this is an ${error.toString()}');
                                          });
                                        },
                                        label: "Task Date",
                                        prefixIcon: Icon(Icons.calendar_today),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .closed
                        .then((value) {
                      cubit.changeBottomSheet(isShow: false, icon: Icons.edit);
                    });
                    cubit.changeBottomSheet(isShow: true, icon: Icons.add);
                  }
                },
                child: Icon(cubit.fabIcon),
              ),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                currentIndex: cubit.currentIndex,
                elevation: 20,
                onTap: (index) {
                  cubit.changeIndex(index);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.menu_outlined),
                    label: 'NewTask',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle_outline),
                    label: 'DoneTask',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.archive_outlined),
                    label: 'ArchivedTask',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
