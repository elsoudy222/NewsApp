import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state){},
      builder: (context,state)
      {
        var list = NewsCubit.get(context).science;

        return ConditionalBuilder(
          condition: state is! NewsLoadingScienceState,
          builder: (context)=>  ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index)=> buildArticleItem(list[index]),
            separatorBuilder: (context , index)=> myDivider(),
            itemCount: 10,
          ),
          fallback: (context)=> const Center(
            child:  CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
