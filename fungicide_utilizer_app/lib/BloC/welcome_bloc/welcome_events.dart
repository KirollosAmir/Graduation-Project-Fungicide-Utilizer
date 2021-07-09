import 'package:equatable/equatable.dart';

class WelcomeEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class FarmerLoginEvent extends WelcomeEvents {}

class FarmerLoginActionEvent extends WelcomeEvents {
  final String mobile;
  final String password;
  FarmerLoginActionEvent({this.mobile, this.password});
}

class FarmerRegisterEvent extends WelcomeEvents {}

class FarmerRegisterActionEvent extends WelcomeEvents {
  final String name;
  final String mobile;
  final String password;
  FarmerRegisterActionEvent({this.name, this.mobile, this.password});
}

class ExpertLoginEvent extends WelcomeEvents {}

class ExpertLoginActionEvent extends WelcomeEvents {
  final String mobile;
  final String password;
  ExpertLoginActionEvent({this.mobile, this.password});
}
