import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:intl/intl.dart';

import 'package:todaynews/shared/components/components.dart';
import 'package:todaynews/shared/cubit/cubit.dart';
import 'package:todaynews/shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  var titleControler = TextEditingController();
  var timeControler = TextEditingController();
  var dateControler = TextEditingController();
  //List<Map> tasks = [];
//late IconData flotingwriteIcon = Icons.pin;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit()..creatDatabase(),
      child: BlocConsumer<TodoCubit, TodoStates>(
        builder: (context, state) => Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text('ToDo App'),
          ),
          body: Conditional.single(
            context: context,
            conditionBuilder: (context) =>
                state is! TodoGetDatabaseLoadingState,
            widgetBuilder: (context) => TodoCubit.get(context)
                .screens[TodoCubit.get(context).currentIndex],
            fallbackBuilder: (context) =>
                Center(child: CircularProgressIndicator()),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (TodoCubit.get(context).isBottomsheet) {
                TodoCubit.get(context).insertToDatabase(
                  title: titleControler.text,
                  time: timeControler.text,
                  date: dateControler.text,
                );

                // insertToDatabase(
                //   date: dateControler.text,
                //   time: timeControler.text,
                //   title: titleControler.text,
                // ).then((value) {
                //   Navigator.pop(context);
                //   isBottomsheet = false;
                //   // setState(() {
                //   //   flotingIcon = Icons.edit;
                //   // });
                // });
              } else {
                scaffoldKey.currentState!
                    .showBottomSheet(
                      (context) => Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(10),
                              topEnd: Radius.circular(10)),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            defaultFormText(
                              controller: titleControler,
                              prefixIcon: Icons.title,
                              lable: 'Task Title',
                              type: TextInputType.text,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            defaultFormText(
                              controller: timeControler,
                              prefixIcon: Icons.watch_later_outlined,
                              lable: 'time Title',
                              type: TextInputType.datetime,
                              onTap: () {
                                print("time clicked");
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  timeControler.text = value!.format(context);
                                });
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            defaultFormText(
                              controller: dateControler,
                              prefixIcon: Icons.watch_later_outlined,
                              lable: 'Date Title',
                              type: TextInputType.datetime,
                              onTap: () {
                                print("Date clicked");
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.parse("2022-05-05"),
                                ).then((value) {
                                  if (value != null) {
                                    dateControler.text =
                                        DateFormat.yMMMd().format(value);
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      elevation: 20,
                    )
                    .closed
                    .then((value) {
                  TodoCubit.get(context).TodoChangeBottomSheetState(
                    isshow: false,
                    icon: Icons.edit,
                  );
                });
                // TodoCubit.get(context).isBottomsheet = true;
                TodoCubit.get(context).TodoChangeBottomSheetState(
                  isshow: true,
                  icon: Icons.add,
                );
                // setState(() {
                //   flotingIcon = ;
                // });
              }
            },
            child: Icon(TodoCubit.get(context).flotingIcon),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: TodoCubit.get(context).currentIndex,
            onTap: (index) {
              TodoCubit.get(context).changeindex(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: 'Tasks',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.check_circle_outline),
                label: 'Done',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.archive_rounded),
                label: 'Archive',
              ),
            ],
          ),
        ),
        listener: (context, state) {
          if (state is TodoInsertDatabaseState) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
