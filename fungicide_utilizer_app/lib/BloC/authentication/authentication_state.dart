import 'package:equatable/equatable.dart';
import 'package:fungicide_utilizer_app/DataLayer/farmer.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitState extends AuthenticationState {}

class LoginLoadingState extends AuthenticationState {}

class FarmerLoginSuccessState extends AuthenticationState {
  final Farmer f;
  FarmerLoginSuccessState({this.f});
}

class LoginErrorState extends AuthenticationState {
  final String message;
  LoginErrorState({this.message});
}

class ConnectionErrorState extends AuthenticationState {
  final String message;
  ConnectionErrorState({this.message});
}

// class AuthenticationInitial extends AuthenticationState {}

// class AuthenticationLoading extends AuthenticationState {}

// class AuthenticationNotAuthenticated extends AuthenticationState {}

// class AuthenticationAuthenticated extends AuthenticationState {
//   final Farmer user;

//   AuthenticationAuthenticated({@required this.user});

//   @override
//   List<Object> get props => [user];
// }

// class AuthenticationFailure extends AuthenticationState {
//   final String message;

//   AuthenticationFailure({@required this.message});

//   @override
//   List<Object> get props => [message];
// }
