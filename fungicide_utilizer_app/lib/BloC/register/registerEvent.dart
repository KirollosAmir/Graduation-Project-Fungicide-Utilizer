import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class StartEvent extends RegisterEvent {}

// ignore: must_be_immutable
class RegisterButttonPressed extends RegisterEvent {
  String name;
  String mobile;
  String password;
  RegisterButttonPressed({this.name, this.mobile, this.password});
}
