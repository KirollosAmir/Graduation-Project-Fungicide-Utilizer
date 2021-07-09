import 'package:equatable/equatable.dart';
import 'package:fungicide_utilizer_app/DataLayer/land.dart';
// import '../../DataLayer/land.dart';

class LandState extends Equatable {
  @override
  List<Object> get props => [];
}

class LandInitiallState extends LandState {}

class LandLoadingState extends LandState {}

// ignore: must_be_immutable
class SuccessState extends LandState {
  List<LandModel> lands;
  SuccessState({this.lands});
}

// ignore: must_be_immutable
class ErrorState extends LandState {
  String message;
  ErrorState({this.message});
}

class ViewLandSuccessState extends LandState {
  final LandModel land;
  ViewLandSuccessState({this.land});
}
