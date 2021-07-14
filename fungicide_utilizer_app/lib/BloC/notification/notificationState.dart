import 'package:equatable/equatable.dart';
import 'package:fungicide_utilizer_app/DataLayer/notification.dart';

class NotificationState extends Equatable {
  @override
  List<Object> get props => [];
}

class NotificationInitialState extends NotificationState {}

class NotificationLoadingState extends NotificationState {}

// ignore: must_be_immutable
class NotificationSuccessState extends NotificationState {
  List<Notification> notifications;
  NotificationSuccessState({this.notifications});
}

// ignore: must_be_immutable
class NotificationErrorState extends NotificationState {
  String message;
  NotificationErrorState({this.message});
}

class ViewNotificationSuccessState extends NotificationState {
  final Notification notification;
  ViewNotificationSuccessState({this.notification});
}

class ConnectionErrorState extends NotificationState {
  final String message;
  ConnectionErrorState({this.message});
}

class NotificationSeenSuccessState extends NotificationState {
  final String message;
  NotificationSeenSuccessState({this.message});
}
