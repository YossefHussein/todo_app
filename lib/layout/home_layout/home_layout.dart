// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../../../modules/archived_task_module/archived_task_module.dart';
import '../../../modules/done_screen_module/done_task_module.dart';
import '../../../modules/new_task_module/new_task_module.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  List<Widget> screen = const [
    NewTaskModule(),
    DoneTaskModule(),
    ArchivedTaskModule(),
  ];
  List<String> title = const [
    'NewTask',
    'DoneTask',
    'ArchivedTask',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title[currentIndex]),
      ),
      body: screen[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          createDataBase();
          getName('name is youssef').then(
            (value) {
              print('$value');
            },
          ).catchError((onError) {
            if (!onError) {
              print('that is error: $onError');
            } else {
              throw ('now happened error: $onError');
            }
          });
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 50,
        showSelectedLabels: true,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
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
    );
  }
}

Future<String> getName(String name) async {
  return name;
}

void createDataBase() async {
  var database = await openDatabase('todo.db', version: 1, onCreate: (
    database,
    version,
  ) {
    print('database is created');
    database
        .execute(
            // 1. (primary key) is thing auto generator when add to table
            // 2. in sqflite no there String it's replace by Text
            // 3. if you write text or TEXT isn't important because sqflite not case sensitive
            // 4. you write title , title is name of field after you write type of field
            'create table task (id INTEGER primary key ,title TEXT , date TEXT , time TEXT , status TEXT )')
        .then((value) {
      print('it\'s done');
    }).catchError((error) {
      print('error is ${error.toString()}');
    });
  }, onOpen: (database) {
    print('open database');
  });
}
