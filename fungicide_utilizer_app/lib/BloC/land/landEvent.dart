import 'package:equatable/equatable.dart';
import '../../DataLayer/land.dart';

class LandEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ViewLandsEvent extends LandEvent {}

class ViewLandEvent extends LandEvent {
  final LandModel land;
  ViewLandEvent(this.land);
}

class AddLandEvent extends LandEvent {}

class DeleteEvent extends LandEvent {}

class ViewHistoryEvent extends LandEvent {}

class ViewStatus extends LandEvent {}

class ResetEvent extends LandEvent {}

// class NotificationSeen extends LandEvent {}
