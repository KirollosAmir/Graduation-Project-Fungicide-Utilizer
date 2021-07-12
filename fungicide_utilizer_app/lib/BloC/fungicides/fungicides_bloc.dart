import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fungicide_utilizer_app/BloC/fungicides/fungicides_event.dart';
import 'package:fungicide_utilizer_app/BloC/fungicides/fungicides_state.dart';
import 'package:fungicide_utilizer_app/repository/fungicide_repo.dart';

class FungicidesBloc extends Bloc<FungicidesEvents, FungicidesStates> {
  FungicidesRepository repo;
  FungicidesBloc(FungicidesStates initialState, this.repo)
      : super(initialState);

  @override
  Stream<FungicidesStates> mapEventToState(FungicidesEvents event) async* {
    if (event is ViewFungicidesEvent) {
      yield FungicidesLoadingState();
      try {
        var fungicides = await repo.fetchFungicides();
        yield ViewFungicidesSuccess(treatments: fungicides);
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    } else if (event is ViewFungicideEvent) {
      yield FungicidesLoadingState();
      try {
        yield ViewFungicideSuccess(treatment: event.treatment);
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    } else if (event is SaveFungicidesButttonPressed) {
      var data = await repo.addFungicide(event.name, event.disc);
      if (data == "Error")
        yield ErrorState(message: "Connection time out. ");
      else if (data == "Invalid") {
        yield ErrorState(message: "Invalid Credintials.");
      } else {
        yield ErrorState(message: "Fungicide Added Successfully.");
      }
    }
  }
}
