import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fungicide_utilizer_app/repository/crops_repo.dart';
import 'crops_events.dart';
import 'crops_states.dart';

class CropsBloc extends Bloc<CropsEvents, CropsStates> {
  CropsRepository repo;
  CropsBloc(CropsStates initialState, this.repo) : super(initialState);

  @override
  Stream<CropsStates> mapEventToState(CropsEvents event) async* {
    if (event is ViewCropsEvent) {
      yield LoadingState();
      try {
        var crops = await repo.fetchCrops();
        yield ViewCropsSuccess(crops: crops);
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    } else if (event is ViewCropEvent) {
      yield LoadingState();
      try {
        yield ViewCropSuccess(crop: event.crop);
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    } else if (event is ViewDiseasesEvent) {
      yield LoadingState();
      try {
        yield ViewDiseasesSuccess(diseases: event.cropp.diseases);
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    } else if (event is ViewDiseaseEvent) {
      yield LoadingState();
      try {
        yield ViewDiseaseSuccess(disease: event.disease);
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    } else if (event is ViewTreatmentsEvent) {
      yield LoadingState();
      try {
        yield ViewTreatmentsSuccess(treatments: event.disease.treatments);
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    } else if (event is ViewTreatmentEvent) {
      yield LoadingState();
      try {
        yield ViewTreatmentSuccess(treatment: event.treatment);
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    } else if (event is SaveCropButttonPressed) {
      var data = await repo.addCrop(event.cropname, event.duration);
      if (data == "Error")
        yield ErrorState(message: "Connection time out. ");
      else if (data == "Invalid") {
        yield ErrorState(message: "Invalid Credintials.");
      } else {
        yield ErrorState(message: "Land Added Successfully.");
      }
    }
  }
}
