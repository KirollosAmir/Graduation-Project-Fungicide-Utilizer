import 'package:equatable/equatable.dart';
import 'package:fungicide_utilizer_app/DataLayer/expert.dart';

abstract class ExpertAuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class ELoginInitState extends ExpertAuthenticationState {}

class ELoginLoadingState extends ExpertAuthenticationState {}

class ExpertLoginSuccessState extends ExpertAuthenticationState {
  final Expert e;
  ExpertLoginSuccessState({this.e});
}

class ELoginErrorState extends ExpertAuthenticationState {
  final String message;
  ELoginErrorState({this.message});
}

class ConnectionErrorState extends ExpertAuthenticationState {
  final String message;
  ConnectionErrorState({this.message});
}
