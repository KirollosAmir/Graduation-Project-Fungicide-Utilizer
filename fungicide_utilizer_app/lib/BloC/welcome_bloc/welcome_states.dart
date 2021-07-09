import 'package:equatable/equatable.dart';

class WelcomeStates extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends WelcomeStates {}

class LoadingState extends WelcomeStates {}

class FarmerLoginSuccess extends WelcomeStates {}

class FarmerLoginActionSuccess extends WelcomeStates {
  final String result;
  FarmerLoginActionSuccess({this.result});
}

class FarmerRegisterSuccess extends WelcomeStates {}

class FarmerRegisterActionSuccess extends WelcomeStates {
  final String result;
  FarmerRegisterActionSuccess({this.result});
}

class ExpertLoginSuccess extends WelcomeStates {}

class ExpertLoginActionSuccess extends WelcomeStates {
  final String result;
  ExpertLoginActionSuccess({this.result});
}

class ErrorState extends WelcomeStates {
  final String message;
  ErrorState({this.message});
}
