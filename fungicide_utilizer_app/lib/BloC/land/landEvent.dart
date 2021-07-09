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

// ignore: must_be_immutable
class SaveLandButttonPressed extends LandEvent {
  String landname;
  String crop;
  String postalcode;
  String stationserial;
  SaveLandButttonPressed(
      {this.landname, this.crop, this.postalcode, this.stationserial});
}

class AddlandButtonEvent extends LandEvent {}

// ignore: must_be_immutable
class DeleteLandButtonPressed extends LandEvent {
  String landid;
  DeleteLandButtonPressed({this.landid});
}

// class NotificationSeen extends LandEvent {}
