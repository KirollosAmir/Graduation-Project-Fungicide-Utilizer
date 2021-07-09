import 'package:equatable/equatable.dart';

//import '../../models/models.dart';

abstract class ExpertAuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class StartEvent extends ExpertAuthenticationEvent {}

// ignore: must_be_immutable
class LoginButttonPressed extends ExpertAuthenticationEvent {
  String mobile;
  String password;
  LoginButttonPressed({this.mobile, this.password});
}
