abstract class NewsStates{}

class NewsInitialState extends NewsStates{}

class NewsBottomNavBarState extends NewsStates{}


class NewsGetBusinessSuccessState extends NewsStates{}
class NewsLoadingBusinessState extends NewsStates{}
class NewsGetBusinessErrorState extends NewsStates {
  final String error;
  NewsGetBusinessErrorState(this.error);
}

class NewsGetSportsSuccessState extends NewsStates{}
class NewsLoadingSportsState extends NewsStates{}
class NewsGetSportsErrorState extends NewsStates {
  final String error;
  NewsGetSportsErrorState(this.error);
}


class NewsGetScienceSuccessState extends NewsStates{}
class NewsLoadingScienceState extends NewsStates{}
class NewsGetScienceErrorState extends NewsStates {
  final String error;
  NewsGetScienceErrorState(this.error);
}

class NewsGetTechnologySuccessState extends NewsStates{}
class NewsLoadingTechnologyState extends NewsStates{}
class NewsGetTechnologyErrorState extends NewsStates {
  final String error;
  NewsGetTechnologyErrorState(this.error);
}


class AppChangeModeState extends NewsStates{}