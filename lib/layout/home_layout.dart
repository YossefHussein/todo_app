import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import '../../modules/archived_task_module.dart';
import '../../modules/done_task_module.dart';
import '../../modules/new_task_module.dart';
import '../../shared/styles/color.dart';
import '../../shared/styles/constant.dart';
import '../../shared/widget/default_form_field.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  // those are for "BottomNavigationBar"
  int currentIndex = 0;

  // to toggle between screen
  List<Widget> screen = const [
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

  /// this is for make database and handling main operation
  Database database;

  @override
  void initState() {
    super.initState();
    // this is to call the database
    createDatabase();
  }

  // this is for see bottomSheet
  var scaffoldKey = GlobalKey<ScaffoldState>();

  // this use for validation
  var formKey = GlobalKey<FormState>();

  // to toggle between bottomSheet open or not
  bool isBottomSheetShown = false;

  // default fab icon and I toggle this  in bottomSheet
  IconData fabIcon = Icons.edit;

  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  List<Map> tasks = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: pBottomSheetColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(pBorderRadius * 2),
            ),
          ),

        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: pColor,
          secondary: sColor,
        ),
      ),
      home: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          // when click on any scree change the appBar to name his screen
          title: Text(title[currentIndex]),
        ),
        body: screen[currentIndex],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (isBottomSheetShown) {
              // this for validate
              if (formKey.currentState.validate()) {
                insertToDatabase(
                  // give data from controller to database
                  date: dateController.text,
                  time: timeController.text,
                  title: titleController.text,
                ).then((value) {
                  Navigator.pop(context);
                  isBottomSheetShown = false;
                  setState(() {
                    fabIcon = Icons.edit;
                  });
                });
              }
            } else {
              // open bottomSheet
              scaffoldKey.currentState
                  .showBottomSheet(
                    (BuildContext context) {
                      return  Container(
                        padding: EdgeInsets.all(pPadding + 15),
                          child: Form(
                            // give the key to see validation
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // this task title formField
                                defaultFormField(
                                  controller: titleController,
                                  label: 'task tile',
                                  // this is validation
                                  validMsg: (String value) {
                                    // if the formField empty see validation
                                    if (value.isEmpty) {
                                      return 'title must not be empty';
                                    }
                                    return null;
                                  },
                                  type: TextInputType.text,
                                  prefixIcon: Icon(Icons.task),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                // this task time formField
                                defaultFormField(
                                  label: 'task time',
                                  validMsg: (String value) {
                                    if (value.isEmpty) {
                                      return 'time must not be empty';
                                    }
                                    return null;
                                  },
                                  onTap: () {
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((value) {
                                      timeController.text =
                                          value.format(context).toString();
                                    });
                                  },
                                  notShowKeyBoard: true,
                                  controller: timeController,
                                  type: TextInputType.datetime,
                                  prefixIcon: Icon(Icons.watch_later),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                // this task date formField
                                defaultFormField(
                                  notShowKeyBoard: true,
                                  controller: dateController,
                                  label: 'date task',
                                  validMsg: (String value) {
                                    if (value.isEmpty) {
                                      return 'date must not be empty';
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
                                      dateController.text =
                                          DateFormat.yMMMEd().format(value);
                                    }).catchError((error) {
                                      print('this is an ${error.toString()}');
                                    });
                                  },
                                  type: TextInputType.datetime,
                                  prefixIcon: Icon(Icons.calendar_today),
                                ),
                              ],
                            ),
                          ),
                      );
                    },
                  )
                  .closed
                  .then((value) {
                    isBottomSheetShown = false;
                    setState(() {
                      fabIcon = Icons.edit;
                    });
                  });
              isBottomSheetShown = true;
              setState(() {
                fabIcon = Icons.add;
              });
            }
          },
          child: Icon(fabIcon),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
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
  }

  Future<String> getName(String name) async {
    return name;
  }

  // create database
  void createDatabase() async {
    /*
     I write this because 'openDatabase' should use await with it
     to this I make tow variable has name database
     first database is variable I handling with him
     and scanned variable is parameter take value of first variable "database"
     */
    database = await openDatabase('todo.db', version: 1,
        onCreate: (database, version) {
      // "execute"  is mean make new
      database.execute(
          // important comment to understand the sqflite statement
          /*
           1. (primary key) is thing auto generator when add to table
              because "id" you don't created all once you adding thing to database.
           2. in sqflite no there String it's replace to Text,
              so Text is meaning "in this field store string value".
           3. if you write text or TEXT isn't important because sqflite not case sensitive.
           4. you write title , title is name of field after you write type of field,
              so it writing like this (name.field type.field).
          */
          'CREATE TABLE task (id INTEGER primary key ,title TEXT , date TEXT , time TEXT , status TEXT )').then(
        (value) {
          print('database created');
        },
      ).catchError(
        (error) {
          print('error is ${error.toString()}');
        },
      );
    }, onOpen: (database) {
      getDataFromDatabase(database).then((value) {
        tasks = value;
        print("database content \n $tasks");
      });
      print('database opened');
    });
  }

  // get data from database
  Future<List<Map>> getDataFromDatabase(database) async {
    return await database.rawQuery("SELECT * FROM task");
  }

  // insert data to database
  Future insertToDatabase({@required String title, time, date}) async {
    return await database.transaction((txn) {
      txn
          .rawInsert(
              // 'INSERT INTO' mean import to table
              // 'task' is name of table
              // 'title,time,date,status' is name places in database
              // 'VALUES' is save this value title field so time and date like that
              'INSERT INTO task(title,time,date,status) VALUES("$title" , "$time","$date","new")')
          .then((value) {
        // value is the id of this record
        print(
            ' the id is ($value)\n\'now you insert new record (mean insert information to task table) have those values\' \n title task: $title \n time task: $time \n date task: $date \n insert task is complete');
      }).catchError((error) {
        // In error
        // give me error and covert error message to string
        print('error is ${error.toString()}');
      });
      return null;
    });
  }
}
