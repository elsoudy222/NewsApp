import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusiness()..getSports()..getScience()..getTechnology(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state ){},
        builder:(context, state ){
          var cubit = NewsCubit.get(context);
          return  Scaffold(
            appBar: AppBar(
              title: const Text("DAILY NEWS"),
              actions:  [
                IconButton(
                    onPressed: (){
                      NewsCubit.get(context).changeAppMode();
                    },
                    icon: const Icon(
                        Icons.brightness_4_outlined,
                        color: Colors.black,
                    ),
                ),
              ],
              leading:
                IconButton(
                  onPressed: (){},
                  icon:const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),),
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomItems,
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.changeBottomNavBar(index);
              },
            ),
          );
        },
      ),
    );
  }
}
