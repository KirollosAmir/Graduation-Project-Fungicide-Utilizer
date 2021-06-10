import 'dart:async';
import 'farmer_drawer_event.dart';

class FarmerDrawerBloc {
  final navigationController = StreamController();
  FarmerDrawerEvent navigationProvider = new FarmerDrawerEvent();

  Stream get getNavigation => navigationController.stream;

  void updateNavigation(String navigation) {
    navigationProvider.updateNavigation(navigation);
    navigationController.sink.add(navigationProvider.currentNavigation);
  }

  void dispose() {
    navigationController.close();
  }
}

final bloc = FarmerDrawerBloc();
