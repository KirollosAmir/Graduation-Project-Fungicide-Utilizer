import 'package:equatable/equatable.dart';
import 'package:fungicide_utilizer_app/DataLayer/notification.dart';

class NotificationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ViewNotificationsEvent extends NotificationEvent {}

class ViewNotificationEvent extends NotificationEvent {
  final Notification notification;
  ViewNotificationEvent({this.notification});
}

class SeenNotificationEvent extends NotificationEvent {}
