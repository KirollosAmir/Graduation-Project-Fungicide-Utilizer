import 'package:equatable/equatable.dart';
import 'package:fungicide_utilizer/DataLayer/land.dart';

class LandState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitiallState extends LandState {}

class LoadingState extends LandState {}

class SuccessState extends LandState {
  List<LandModel> lands;
  SuccessState({this.lands});
}

class ErrorState extends LandState {
  String message;
  ErrorState({this.message});
}
