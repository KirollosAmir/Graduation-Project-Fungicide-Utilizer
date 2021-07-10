import 'package:equatable/equatable.dart';
import '../../DataLayer/treatment.dart';

class FungicidesStates extends Equatable {
  @override
  List<Object> get props => [];
}

class FungicidesInitialState extends FungicidesStates {}

class FungicidesLoadingState extends FungicidesStates {}

class ViewFungicidesSuccess extends FungicidesStates {
  final List<Treatment> treatments;
  ViewFungicidesSuccess({this.treatments});
}

class ViewFungicideSuccess extends FungicidesStates {
  final Treatment treatment;
  ViewFungicideSuccess({this.treatment});
}

class ErrorState extends FungicidesStates {
  final String message;
  ErrorState({this.message});
}

class AddingFungicideState extends FungicidesStates {}

class AddFungicideSuccessState extends FungicidesStates {
  final String message;
  AddFungicideSuccessState({this.message});
}
