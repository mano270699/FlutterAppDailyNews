import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todaynews/layout/News_app/cubit/states.dart';
import 'package:todaynews/modules/business/business_screen.dart';
import 'package:todaynews/modules/science/science_screen.dart';
import 'package:todaynews/modules/sports/sports_screen.dart';
import 'package:todaynews/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsinitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business_center_outlined),
      label: "Business",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: "Sports",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: "Science",
    ),
  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (currentIndex == 1) getSports();
    if (currentIndex == 2) getScience();
    emit(NewsNavBottomState());
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());

    DioHelper.getData(
      //https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=df81b9347da240deb36e7d11547a0471
      path: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': 'df81b9347da240deb36e7d11547a0471',
      },
    ).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSucsessState());
    }).catchError((err) {
      print(err.toString());
      emit(NewsGetBusinessErrorState(err.toString()));
    });
  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewsGetScienceLoadingState());
    if (science.length == 0) {
      DioHelper.getData(
        //https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=df81b9347da240deb36e7d11547a0471
        path: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': 'df81b9347da240deb36e7d11547a0471',
        },
      ).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSucsessState());
      }).catchError((err) {
        print(err.toString());
        emit(NewsGetScienceErrorState(err.toString()));
      });
    } else {
      emit(NewsGetScienceSucsessState());
    }
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingState());
    if (sports.length == 0) {
      DioHelper.getData(
        //https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=df81b9347da240deb36e7d11547a0471
        path: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': 'df81b9347da240deb36e7d11547a0471',
        },
      ).then((value) {
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSucsessState());
      }).catchError((err) {
        print(err.toString());
        emit(NewsGetSportsErrorState(err.toString()));
      });
    } else {
      emit(NewsGetSportsSucsessState());
    }
  }

  List<dynamic> search = [];
  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());

    DioHelper.getData(
      //https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=df81b9347da240deb36e7d11547a0471
      path: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': 'df81b9347da240deb36e7d11547a0471',
      },
    ).then((value) {
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSucsessState());
    }).catchError((err) {
      print(err.toString());
      emit(NewsGetSearchErrorState(err.toString()));
    });
  }
}
