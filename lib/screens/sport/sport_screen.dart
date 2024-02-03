import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/news_cubit/cubit.dart';
import 'package:news_app/cubits/news_cubit/state.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/widgets/article_list.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: BlocBuilder<NewsCubit, NewsStates>(builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        List<Article> list = cubit.sport;
        if (state is SportNewsState) {
          return ArticleList(list: list);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
