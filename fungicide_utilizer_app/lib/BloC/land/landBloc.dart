import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fungicide_utilizer_app/BloC/land/landEvent.dart';
import 'package:fungicide_utilizer_app/BloC/land/landState.dart';
import 'package:fungicide_utilizer_app/repository/mylands_repo.dart';

class LandBloc extends Bloc<LandEvent, LandState> {
  MyLandsRepos repo;
  LandBloc(LandState initialState, this.repo) : super(initialState);

  @override
  Stream<LandState> mapEventToState(LandEvent event) async* {
    if (event is ViewLandsEvent) {
      yield LandLoadingState();
      try {
        var landss = await repo.fetchLands();
        yield SuccessState(lands: landss);
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    } else if (event is ViewLandEvent) {
      yield LandLoadingState();
      try {
        yield ViewLandSuccessState(land: event.land);
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    } else if (event is ResetEvent) {
      yield LandLoadingState();
      try {
        yield LandInitiallState();
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    } else if (event is SaveLandButttonPressed) {
      var data = await repo.addLands(
          event.landname, event.crop, event.postalcode, event.stationserial);
      if (data == "Error")
        yield ConnectionErrorState(message: "Connection time out. ");
      else if (data == "Invalid") {
        yield ConnectionErrorState(message: "Invalid Credintials.");
      } else {
        yield AddLandSuccessState(message: "Land Added Successfully.");
      }
    } else if (event is DeleteLandButtonPressed) {
      var data = await repo.deleteLand(event.landid);
      if (data == "Error")
        yield ConnectionErrorState(message: "Connection time out. ");
      else {
        yield DeleteLandSuccessState(message: "Land Added Successfully.");
      }
    }
  }
}
