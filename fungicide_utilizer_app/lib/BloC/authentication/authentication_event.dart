import 'package:equatable/equatable.dart';

//import '../../models/models.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class StartEvent extends AuthenticationEvent {}

// ignore: must_be_immutable
class LoginButttonPressed extends AuthenticationEvent {
  String mobile;
  String password;
  LoginButttonPressed({this.mobile, this.password});
}
