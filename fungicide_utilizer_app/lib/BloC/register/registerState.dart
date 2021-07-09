import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterInitState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  // final Farmer f;
  // FarmerLoginSuccessState({this.f});
}

class RegisterErrorState extends RegisterState {
  final String message;
  RegisterErrorState({this.message});
}

class ConnectionErrorState extends RegisterState {
  final String message;
  ConnectionErrorState({this.message});
}
