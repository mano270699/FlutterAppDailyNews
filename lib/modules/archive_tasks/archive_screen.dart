import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:todaynews/shared/components/components.dart';
import 'package:todaynews/shared/cubit/cubit.dart';
import 'package:todaynews/shared/cubit/states.dart';

class ArchiveScreen extends StatelessWidget {
  //const ArchiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (context, state) => TodoCubit(),
      builder: (context, state) {
        var tasks = TodoCubit.get(context).archiveTasks;
        return Conditional.single(
          context: context,
          conditionBuilder: (context) => tasks.length > 0,
          widgetBuilder: (context) => ListView.separated(
              itemBuilder: (context, index) =>
                  buildTaskItem(tasks[index], context),
              separatorBuilder: (context, index) => Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.blue[300],
                  ),
              itemCount: tasks.length),
          fallbackBuilder: (context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.do_not_disturb_alt_sharp,
                  size: 50,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "No archive yet, PLZ Add at least one :)",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
