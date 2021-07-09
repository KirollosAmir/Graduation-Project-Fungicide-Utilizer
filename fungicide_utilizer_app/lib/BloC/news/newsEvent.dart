import 'package:equatable/equatable.dart';
import 'package:fungicide_utilizer_app/DataLayer/news.dart';

class NewsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ViewNewsEvent extends NewsEvent{}

class ViewNewEvent extends NewsEvent {
  final News onenews;
  ViewNewEvent(this.onenews);
}
