import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fungicide_utilizer_app/BloC/news/newsEvent.dart';
import 'package:fungicide_utilizer_app/BloC/news/newsState.dart';
import 'package:fungicide_utilizer_app/repository/news_repo.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsRepos repo;
  NewsBloc(NewsState initiallState, this.repo) : super(initiallState);

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is ViewNewsEvent) {
      yield NewsLoadingState();
      try {
        var news = await repo.fetchNews();
        yield NewsSuccessState(news: news);
      } catch (e) {
        yield NewsErrorState(message: e.toString());
      }
      } else if (event is ViewNewEvent) {
      yield NewsLoadingState();
      try{
        yield ViewNewSuccessState(news:event.onenews);
      }catch(e){

      }
    }
  }
}
