import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/news_cubit/cubit.dart';
import 'package:news_app/cubits/news_cubit/state.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/widgets/article_list.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: BlocBuilder<NewsCubit, NewsStates>(builder: (context, state) {
        List<Article>? list = NewsCubit.get(context).business;
        if (state is BusinessNewsState) {
          return ArticleList(list: list);
        } else if (state is ErrorGetNewsState) {
          return const Center(
            child: Text("error"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
