import 'dart:async';
import 'expertDrawerEvent.dart';

class ExpertDrawerBloc {
  final navigationController = StreamController();
  ExpertDrawerEvent navigationProvider = new ExpertDrawerEvent();

  Stream get getNavigation => navigationController.stream;

  void updateNavigation(String navigation) {
    navigationProvider.updateNavigation(navigation);
    navigationController.sink.add(navigationProvider.currentNavigation);
  }

  void dispose() {
    navigationController.close();
  }
}

final bloc = ExpertDrawerBloc();
