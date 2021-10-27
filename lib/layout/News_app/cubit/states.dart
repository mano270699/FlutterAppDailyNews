abstract class NewsStates {}

class NewsinitialState extends NewsStates {}

class NewsNavBottomState extends NewsStates {}

class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetBusinessSucsessState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates {
  final String erorr;

  NewsGetBusinessErrorState(this.erorr);
}

class NewsGetSportsLoadingState extends NewsStates {}

class NewsGetSportsSucsessState extends NewsStates {}

class NewsGetSportsErrorState extends NewsStates {
  final String erorr;

  NewsGetSportsErrorState(this.erorr);
}

class NewsGetScienceLoadingState extends NewsStates {}

class NewsGetScienceSucsessState extends NewsStates {}

class NewsGetScienceErrorState extends NewsStates {
  final String erorr;

  NewsGetScienceErrorState(this.erorr);
}

class NewsGetSearchLoadingState extends NewsStates {}

class NewsGetSearchSucsessState extends NewsStates {}

class NewsGetSearchErrorState extends NewsStates {
  final String erorr;

  NewsGetSearchErrorState(this.erorr);
}
