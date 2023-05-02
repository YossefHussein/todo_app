import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import 'states.dart';
import '../../modules/archived_task_module.dart';
import '../../modules/done_task_module.dart';
import '../../modules/new_task_module.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  // to get all things in 'AppCubit'
  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  /// this is for make database and handling main operation from it
  late Database database;

  // those are for "BottomNavigationBar"
  int currentIndex = 0;

  // to toggle between screen
  List<Widget> screen = [
    NewTaskModule(),
    DoneTaskModule(),
    ArchivedTaskModule(),
  ];

  // this to toggle between title of screen
  List<String> title = const [
    'NewTask',
    'DoneTask',
    'ArchivedTask',
  ];

  // task save here
  List<Map> tasks = [];

  // to toggle between bottomSheet open or not to see icon edit or not
  bool isBottomSheetShown = false;

  // default fab icon and I toggle this  in bottomSheet
  IconData fabIcon = Icons.edit;

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavStates());
  }

  // this method is for change icon when click on FAB button
  void changeBottomSheet({
    required bool isShow,
    required IconData icon,
  })  {
    isBottomSheetShown = isShow;
    fabIcon = icon;
    emit(AppChangeBottomSheetState());
  }

  // create database
  void createDatabase() {
    // 'todo.db' is name of database
    // 'version: 1' mean version of database, and this change when add or delete colum to database
    openDatabase('todo.db', version: 1,
        // 'onCreate' mean create the database but this just in once
        onCreate: (database, version) {
      // 'execute'  is mean make new database
      database.execute(
          // important comment to understand the sqflite statement
          /*
           1. (primary key) is thing auto generator when add to table
              because "id" you don't created all once you adding thing to database.
           2. in sqflite no there String it's replace to TEXT,
              so TEXT is meaning "in this field store string value".
           3. if you write text or TEXT isn't important because sqflite not case sensitive.
           4. you write title , title is name of field after you write type of field,
              so it writing like this (name.field type.field).
          */
          'CREATE TABLE task (id INTEGER PRIMARY KEY,title TEXT , date TEXT , time TEXT , status TEXT )').then(
        (value) {
          print('database created');
        },
      ).catchError(
        (error) {
          print('error is ${error.toString()}');
        },
      );
    },
        // 'onOpen' mean after create database open then do thing you write it
        onOpen: (database) {
      // call the 'getDataFromDatabase' method to save value from database in task to use in app
      getDataFromDatabase(database).then((value) {
        // save 'value' database in tasks
        tasks = value;
        // print content of database
        print("database content \n $tasks");
        // change state
        emit(AppGetDatabaseState());
      }).catchError((error) {
        print('this is error: $error');
      });
      // if 'onCreate' make database, then open database and print to console open 'database'
      print('database opened');
    }).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  // insert data to database
  // those parameters inserted in database when call
  Future<void> insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    // call database variable and then adding
    // form 'database' doing transaction
    // 'txn' this parameter
    await database.transaction((txn) async {
      // rawInsert mean insert new row in database
      txn.rawInsert(
        // 'INSERT INTO' mean import to table
        // 'task' is name of table
        // 'title,time,date,status' is name places in database
        // 'VALUES' is save this value title field so time and date like that
        'INSERT INTO task(title,time,date,status) VALUES("$title" , "$time","$date","new")',
      ).then((value) {
        // print information of insert
        // value are id of record
        print(
            'the id is ($value)\n \'now you insert new record (mean insert information to task table) have those values\' \n title task: $title \n time task: $time \n date task: $date \n insert task is complete');
        emit(AppInsertDatabaseState());
        getDataFromDatabase(database).then((value) {
          tasks = value;
          print("database content \n $tasks");
          emit(AppGetDatabaseState());
        });
      }).catchError((error) {
        // In error
        // give me error and covert error message to string
        print('error is ${error.toString()}');
      });
      return null;
    });
  }

  // get data from database
  Future<List<Map>> getDataFromDatabase(database) async {
    // 'SELECT' mean give me or take table
    // '*' all thing
    // 'FROM' mean from this
    // 'task' this our table
    return await database.rawQuery("SELECT * FROM task");
  }
}
