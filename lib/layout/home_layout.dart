import 'package:easy_localization/easy_localization.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/shared/bloc/app_cubit.dart';
import '../shared/bloc/states.dart';
import '../shared/components/components.dart';
import '../shared/components/constant.dart';
import '../shared/styles/color.dart';
import '../shared/translations/locale_keys.dart';

// ignore: must_be_immutable
class HomeLayout extends StatefulWidget {
  HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is AppInsertDatabaseState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
      
        return Scaffold(
          // this to bottom sheet
          // for see in screen
          key: cubit.scaffoldKey,
          appBar: AppBar(
            // when click on any scree change the appBar to name his screen
            title: Text(
              cubit.title[cubit.currentIndex].tr(),
            ),
          ),
          body: cubit.screen[cubit.currentIndex],
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // if bottom sheet shown from user
              if (cubit.isBottomSheetShown) {
                // doing validation on defaultFormField
                if (cubit.formKey.currentState!.validate()) {
                  cubit.insertToDatabase(
                    // give data from controller to database
                    title: cubit.titleController.text,
                    date: cubit.dateController.text,
                    time: cubit.timeController.text,
                  );
                }
              } else {
                cubit.scaffoldKey.currentState!
                    .showBottomSheet(
                      (context) => SingleChildScrollView(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Form(
                              key: cubit.formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  // this task title formField
                                  defaultFormField(
                                      controller: cubit.titleController,
                                      type: TextInputType.text,
                                      // this is validation
                                      validMsg: (value) {
                                        // if the formField empty see validation
                                        if (value!.isEmpty) {
                                          return "${LocaleKeys.titleIsEmptyFormFiled.tr()}";
                                        }
                                        return null;
                                      },
                                      onTap: () {
                                        print(cubit.timeController.toString());
                                      },
                                      label:
                                          "${LocaleKeys.taskTitleFormFiledLabel.tr()}",
                                      prefixIcon: Icon(Icons.title)),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  // this task time formField
                                  defaultFormField(
                                    disableKeyBoard: true,
                                    controller: cubit.timeController,
                                    type: TextInputType.datetime,
                                    validMsg: (value) {
                                      if (value!.isEmpty) {
                                        return "${LocaleKeys.titleIsEmptyFormFiled.tr()}";
                                      }
                                      return null;
                                    },
                                    onTap: () {
                                      showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.now())
                                          .then((value) {
                                        cubit.timeController.text =
                                            value!.format(context).toString();

                                        print(value.format(context));
                                      });
                                    },
                                    label:
                                        "${LocaleKeys.taskTimeFormFiledLabel.tr()}",
                                    prefixIcon: Icon(Icons.watch_later_rounded),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  defaultFormField(
                                    disableKeyBoard: true,
                                    controller: cubit.dateController,
                                    type: TextInputType.datetime,
                                    validMsg: (value) {
                                      if (value!.isEmpty) {
                                        return "${LocaleKeys.dateIsEmptyFormFiled.tr()}";
                                      }
                                      return null;
                                    },
                                    onTap: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse('2100-01-01'),
                                      ).then((value) {
                                        // equal the value getting from "showDatePicker" to timeController
                                        cubit.dateController.text =
                                            DateFormat.yMMMEd().format(value!);
                                      }).catchError((error) {
                                        print('this is an ${error.toString()}');
                                      });
                                    },
                                    label:
                                        "${LocaleKeys.taskDateFormFiledLabel.tr()}",
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
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.menu_outlined),
                label: '${LocaleKeys.newTaskBottomNav.tr()}',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.check_circle_outline),
                label: '${LocaleKeys.doneTaskBottomNav.tr()}',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.archive_outlined),
                label: '${LocaleKeys.archivedTaskBottomNav.tr()}',
              ),
            ],
          ),
        );
      },
    );
  }

}
