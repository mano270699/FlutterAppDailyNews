import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todaynews/modules/archive_tasks/archive_screen.dart';
import 'package:todaynews/modules/done_tasks/done_task_screen.dart';
import 'package:todaynews/modules/new_tasks/new_tasks_screen.dart';
import 'package:todaynews/shared/cubit/states.dart';
import 'package:todaynews/shared/network/local/cache_helper.dart';

class TodoCubit extends Cubit<TodoStates> {
  TodoCubit() : super(TodoIntialState());

  static TodoCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    TaskScreen(),
    DoneScreen(),
    ArchiveScreen(),
  ];
  void changeindex(int index) {
    currentIndex = index;
    emit(TodoChangeNavBarState());
  }

  List<Map> newTasks = [];
  List<Map> donetasks = [];
  List<Map> archiveTasks = [];
  late Database database;
  void creatDatabase() {
//id integer
//title String
//date String
//time String
//status String
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print("database Created");
        database
            .execute(
                'create table tasks (id INTEGER PRIMARY KEY,title TEXT, date TEXT, time TEXT, status TEXT)')
            .then((value) {
          print('Database created');
        }).catchError((onError) {
          print("onError: ${onError.toString()}");
        });
      },
      onOpen: (database) {
        getDataFromDatebase(database);
        // print("database Created");
      },
    ).then((value) {
      database = value;
      emit(TodoCreateDatabaseState());
    });
  }

  insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    await database.transaction((txn) async {
      txn
          .rawInsert(
              'Insert into tasks("title",date,time,status) values("$title","$date","$time","new") ')
          .then((value) {
        print("Row $value Inserted :)");
        emit(TodoInsertDatabaseState());

        getDataFromDatebase(database);
      }).catchError((err) {
        print("Ererr!!!${err.toString()}");
      });
      return null;
    });
  }

  void getDataFromDatebase(Database database) {
    emit(TodoGetDatabaseLoadingState());
    newTasks = [];
    donetasks = [];
    archiveTasks = [];
    database.rawQuery('Select * from tasks')
      ..then((value) {
        value.forEach((element) {
          if (element['status'] == 'new')
            newTasks.add(element);
          else if (element['status'] == 'done')
            donetasks.add(element);
          else
            archiveTasks.add(element);
        });

        emit(TodoGetDatabaseState());
      });
  }

  bool isBottomsheet = false;
  late IconData flotingIcon = Icons.edit;
  void TodoChangeBottomSheetState({
    required bool isshow,
    required IconData icon,
  }) {
    isBottomsheet = isshow;
    flotingIcon = icon;
    emit(TodochangeBootomsheetstate());
  }

  void updatestatus({
    required String status,
    required int id,
  }) async {
    database.rawUpdate('UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id]).then((value) {
      getDataFromDatebase(database);
      emit(TodoUpdateDatabaseState());
      // emit(TodoGetDatabaseState());
    });
  }

  void deleteStatus({
    required int id,
  }) async {
    database.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getDataFromDatebase(database);
      emit(TodoDeleteDatabaseState());
      // emit(TodoGetDatabaseState());
    });
  }

  bool isDark = false;
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppchangeModetate());
    } else {
      isDark = !isDark;
      CacheHelper.putDate(key: 'isDark', value: isDark).then((value) {
        emit(AppchangeModetate());
      });
    }
  }
}
