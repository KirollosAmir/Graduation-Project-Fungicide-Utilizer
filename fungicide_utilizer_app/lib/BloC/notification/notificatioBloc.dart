import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fungicide_utilizer_app/BloC/notification/NotificatioEvent.dart';
import 'package:fungicide_utilizer_app/BloC/notification/notificationState.dart';
import 'package:fungicide_utilizer_app/repository/notifications_repo.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationRepos repo;
  NotificationBloc(NotificationState inittialState, this.repo)
      : super(inittialState);
  @override
  Stream<NotificationState> mapEventToState(NotificationEvent event) async* {
    if (event is ViewNotificationsEvent) {
      yield NotificationLoadingState();
      try {
        var nots = await repo.fetchNots();
        yield NotificationSuccessState(notifications: nots);
      } catch (e) {
        yield NotificationErrorState(message: e.toString());
      }
    } else if (event is ViewNotificationEvent) {
      yield NotificationLoadingState();
      try {
        yield ViewNotificationSuccessState(notification: event.notification);
      } catch (e) {
        yield NotificationErrorState(message: e.toString());
      }
    }
  }
}
