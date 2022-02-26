import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

import 'layout/news_layout/news_layout.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => NewsCubit(),
        child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, State){},
          builder: (context, state){
            return  MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'NEWS APP',
              theme: ThemeData(
                  primarySwatch: Colors.teal,
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: const AppBarTheme(
                    titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                    ),
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                  ),
                  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.teal,
                      elevation: 20.0)),
              darkTheme: ThemeData(
                  primarySwatch: Colors.teal,
                  scaffoldBackgroundColor: HexColor("cccccc"),
                  appBarTheme: AppBarTheme(
                    titleTextStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor("cccccc"),
                      statusBarBrightness: Brightness.light,
                    ),
                    backgroundColor: HexColor("cccccc"),
                    elevation: 0.0,
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.teal,
                    elevation: 20.0,
                    backgroundColor: HexColor("cccccc"),
                  )),
              themeMode: NewsCubit.get(context).isDark? ThemeMode.dark : ThemeMode.light,
              home: const NewsLayout(),
            );
          },
        ),
    );
  }
}
