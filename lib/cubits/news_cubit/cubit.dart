import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/cubits/news_cubit/state.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/repo/news_repo.dart';
import 'package:news_app/screens/business/business_screen.dart';
import 'package:news_app/screens/sciences/sciences_screen.dart';
import 'package:news_app/screens/settings/settings_screen.dart';
import 'package:news_app/screens/sport/sport_screen.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentButton = 0;
  List<Article> business = [];
  List<Article> sport = [];
  List<Article> science = [];

  List<Widget> screen = [
    const BusinessScreen(),
    const SportScreen(),
    const SciencesScreen(),
    const SettingsScreen()
  ];

  void changeBottunNavBarIndex({required int index}) {
    currentButton = index;

    emit(NewsChangeBottomNabBarState());
    if (index == 1) {
      getSportData();
    } else if (index == 2) {
      getScienceData();
    } else if (index == 0) {
      getBusinessData();
    }
  }

  void getBusinessData() async {
    // business.getData(
    //     category: "business",
    // );
    emit(LoadingBusinessNewsState());
    if (business.isEmpty) {
      try {
        business = await getArticlesOf("business");
        emit(BusinessNewsState());
      } catch (error) {
        emit(ErrorGetNewsState(error.toString()));
      }
    } else {
      emit(BusinessNewsState());
    }
  }

  void getSportData() async {
    emit(LoadingSportNewsState());
    if (sport.isEmpty) {
      try {
        sport = await getArticlesOf("sport");
        emit(SportNewsState());
      } catch (e) {
        emit(ErrorGetNewsState(e.toString()));
      }
    } else {
      emit(SportNewsState());
    }
  }

  void getScienceData() async {
    emit(LoadingSciencesNewsState());
    if (science.isEmpty) {
      try {
        science = await getArticlesOf("science");
        emit(SciencesNewsState());
      } catch (e) {
        emit(ErrorGetNewsState(e.toString()));
      }
    } else {
      emit(SciencesNewsState());
    }
  }
}
