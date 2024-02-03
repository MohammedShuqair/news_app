import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/search_cubit/cubit.dart';
import 'package:news_app/cubits/search_cubit/state.dart';
import 'package:news_app/widgets/article_list.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchCubit(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:
              BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
            SearchCubit cubit = SearchCubit.get(context);
            return Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                SearchBar(
                  hintText: "Search",
                  onSubmitted: cubit.onSubmit,
                ),
                const SizedBox(
                  height: 80,
                ),
                Expanded(child: ArticleList(list: cubit.result))
              ],
            );
          }),
        ),
      ),
    );
  }
}
