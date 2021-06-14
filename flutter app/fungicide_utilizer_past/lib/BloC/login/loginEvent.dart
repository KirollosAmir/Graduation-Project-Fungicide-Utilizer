import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginEvent extends Equatable {
  final List props;
  LoginEvent([this.props = const []]) : super();
}

class Login extends LoginEvent {
  final String email;
  final String pass;

  Login(this.email, this.pass) : super([]);
}
