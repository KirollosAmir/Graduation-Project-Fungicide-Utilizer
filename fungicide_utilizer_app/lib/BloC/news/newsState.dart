import 'package:equatable/equatable.dart';
import 'package:fungicide_utilizer_app/DataLayer/news.dart';

class NewsState extends Equatable {
  @override
  List<Object> get props => [];
}

class NewsInitialState extends NewsState {}

class NewsLoadingState extends NewsState {}

// ignore: must_be_immutable
class NewsSuccessState extends NewsState {
  List<News> news;
  NewsSuccessState({this.news});
}

// ignore: must_be_immutable
class NewsErrorState extends NewsState {
  String message;
  NewsErrorState({this.message});
}

class ViewNewSuccessState extends NewsState {
  final News news;
  ViewNewSuccessState({this.news});
}
