import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todaynews/shared/bloc_observer.dart';
import 'package:todaynews/shared/cubit/cubit.dart';
import 'package:todaynews/shared/cubit/states.dart';
import 'package:todaynews/shared/network/local/cache_helper.dart';
import 'package:todaynews/shared/network/remote/dio_helper.dart';

import 'layout/News_app/cubit/cubit.dart';
import 'layout/News_app/news_layout.dart';
import 'layout/Todo_app/home_layout.dart';
import 'modules/counter/counter_screan.dart';
import 'modules/login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(MyApp(false));
  /*DioHelper.init();
  await CacheHelper.init();
  var isDark = CacheHelper.getData(key: "isDark");
  if (isDark != null) runApp(MyApp(isDark));*/
}

class MyApp extends StatelessWidget {
  final bool isDark;
  MyApp(this.isDark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()..getBusiness(),
        ),
        BlocProvider(
            create: (context) => TodoCubit()
              ..changeAppMode(
                fromShared: isDark,
              )),
      ],
      child: BlocConsumer<TodoCubit, TodoStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
                primaryColor: Colors.deepOrange,
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange,
                ),
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                  titleSpacing: 20,
                  iconTheme: IconThemeData(color: Colors.black),
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    elevation: 30,
                    selectedItemColor: Colors.deepOrange)),
            darkTheme: ThemeData(
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              scaffoldBackgroundColor: HexColor("141432"),
              primaryColor: Colors.deepOrange,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              appBarTheme: AppBarTheme(
                titleSpacing: 20,
                iconTheme: IconThemeData(color: Colors.white),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor("141432"),
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: HexColor("141432"),
                elevation: 0.0,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  elevation: 30,
                  backgroundColor: HexColor("141432"),
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey),
            ),
            themeMode: TodoCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: NewsLayout(),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
