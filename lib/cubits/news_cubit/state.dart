abstract class NewsStates{}
class NewsInitialState extends NewsStates {}

class NewsChangeBottomNabBarState extends NewsStates {}

class LoadingBusinessNewsState extends NewsStates {}
class LoadingSportNewsState extends NewsStates {}
class LoadingSciencesNewsState extends NewsStates {}


class BusinessNewsState extends NewsStates {}
class SportNewsState extends NewsStates {}
class SciencesNewsState extends NewsStates {}

class SuccessGetNewsState extends NewsStates {}
class ErrorGetNewsState extends NewsStates {
  ErrorGetNewsState(this.error);
  final String error;
}





