// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/modules/technology/technology_screen.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{

  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = const[
    BottomNavigationBarItem(
        icon: Icon(Icons.business),
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
    BottomNavigationBarItem(
      icon: Icon(Icons.smartphone),
      label: "Technology",
    ),
  ];

  List<Widget> screens = const[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    TechnologyScreen(),

  ];


void changeBottomNavBar(int index) {
  currentIndex = index;
  if(currentIndex == 1) getSports();
  if(currentIndex == 2) getScience();
  if(currentIndex == 3) getScience();



  emit(NewsBottomNavBarState());
}



List<dynamic> business=[];
void getBusiness(){
  emit(NewsLoadingBusinessState());
  DioHelper.getData(
      url: "v2/top-headlines",
      query: {
        "country":"us",
        "category":"business",
        "apiKey":"6cbe9fb17eec4fd8b44b155f59ad67ec",
      },
  ).then((value) {
    business = value.data["articles"];
    print(business[0]["title"]);

    emit(NewsGetBusinessSuccessState());
  }).catchError((error){
    print(error.toString());
    emit(NewsGetBusinessErrorState(error.toString()));
  });

}

List<dynamic> sports=[];
void getSports() {
    emit(NewsLoadingSportsState());
    DioHelper.getData(
      url: "v2/top-headlines",
      query: {
        "country":"us",
        "category":"sports",
        "apiKey":"6cbe9fb17eec4fd8b44b155f59ad67ec",
      },
    ).then((value) {
      sports = value.data["articles"];
      print(sports[0]["title"]);

      emit(NewsGetSportsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });


  }



  List<dynamic> science=[];
  void getScience() {
    emit(NewsLoadingScienceState());
    DioHelper.getData(
      url: "v2/top-headlines",
      query: {
        "country":"us",
        "category":"science",
        "apiKey":"6cbe9fb17eec4fd8b44b155f59ad67ec",
      },
    ).then((value) {
      science = value.data["articles"];
      print(science[0]["title"]);

      emit(NewsGetScienceSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });

  }

  List<dynamic> technology=[];
  void getTechnology() {
    emit(NewsLoadingTechnologyState());
    DioHelper.getData(
      url: "v2/top-headlines",
      query: {
        "country":"us",
        "category":"technology",
        "apiKey":"6cbe9fb17eec4fd8b44b155f59ad67ec",
      },
    ).then((value) {
      technology = value.data["articles"];
      print(technology[0]["title"]);

      emit(NewsGetTechnologySuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetTechnologyErrorState(error.toString()));
    });

  }

bool isDark = false;


  void changeAppMode(){
    isDark = !isDark;
    emit(AppChangeModeState());
}

}



