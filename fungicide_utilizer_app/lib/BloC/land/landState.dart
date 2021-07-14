import 'package:equatable/equatable.dart';
import 'package:fungicide_utilizer_app/DataLayer/land.dart';

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

class AddingLandState extends LandState {}

class AddLandSuccessState extends LandState {
  final String message;
  AddLandSuccessState({this.message});
}

class ConnectionErrorState extends LandState {
  final String message;
  ConnectionErrorState({this.message});
}

class DeleteLandState extends LandState {}

class DeleteLandSuccessState extends LandState {
  final String message;
  DeleteLandSuccessState({this.message});
}

class AddingObservationState extends LandState {}

class AddObservationSuccessState extends LandState {
  final String message;
  AddObservationSuccessState({this.message});
}
