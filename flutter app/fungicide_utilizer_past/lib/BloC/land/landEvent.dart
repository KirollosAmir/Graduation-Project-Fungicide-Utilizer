import 'package:equatable/equatable.dart';

class LandEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ViewLandsEvent extends LandEvent {}

class AddLandEvent extends LandEvent {}

class DeleteEvent extends LandEvent {}

class ViewHistoryEvent extends LandEvent {}

class ViewStatus extends LandEvent {}

// class NotificationSeen extends LandEvent {}
