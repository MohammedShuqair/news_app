import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/search_cubit/state.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/repo/news_repo.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(InitSearchState());
  static SearchCubit get(context) => BlocProvider.of(context);

  List<Article> result = [];

  void onSubmit(String q) async {
    //loading state
    //store data or throw error

    try {
      result = await search(q);
      emit(SubmitSearchState());
    } catch (e) {
      print(e.toString());
    }
  }
}
