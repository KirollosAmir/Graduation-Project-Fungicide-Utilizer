import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fungicide_utilizer_app/BloC/diseases/diseases_event.dart';
import 'package:fungicide_utilizer_app/BloC/diseases/diseases_state.dart';
import 'package:fungicide_utilizer_app/repository/disease_repo.dart';

class DiseasesBloc extends Bloc<DiseasesEvents, DiseasesStates> {
  DiseaseRepository repo;
  DiseasesBloc(DiseasesStates initialState, this.repo) : super(initialState);

  @override
  Stream<DiseasesStates> mapEventToState(DiseasesEvents event) async* {
    if (event is ViewDiseasesEvent) {
      yield DiseasesLoadingState();
      try {
        var diseases = await repo.fetchDiseases();
        yield ViewDiseasesSuccess(diseases: diseases);
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    } else if (event is ViewDiseaseEvent) {
      yield DiseasesLoadingState();
      try {
        yield ViewDiseaseSuccess(disease: event.disease);
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    } else if (event is ViewTreatmentsEvent) {
      yield DiseasesLoadingState();
      try {
        yield ViewTreatmentsSuccess(treatments: event.disease.treatments);
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    } else if (event is ViewTreatmentEvent) {
      yield DiseasesLoadingState();
      try {
        yield ViewTreatmentSuccess(treatment: event.treatment);
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    } else if (event is SaveDiseaseButttonPressed) {
      yield DiseasesLoadingState();
      var data = await repo.addDisease(
          event.diseasename, event.severity, event.symptoms);
      if (data == "Error")
        yield ErrorState(message: "Connection time out. ");
      else if (data == "Invalid") {
        yield ErrorState(message: "Invalid Credintials.");
      } else {
        yield ErrorState(message: "Land Added Successfully.");
      }
    } else if (event is ViewNotFungicide) {
      yield DiseasesLoadingState();
      var fungicides = await repo.fetchNotFungicide(event.disease.id);
      try {
        yield ViewNotFungicideSuccess(
            disease: event.disease, fungicides: fungicides);
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    } else if (event is AddFungicideDiseaseEvent) {
      yield DiseasesLoadingState();
      var data = await repo.addTreatment(
          event.diseaseid, event.fungicideid, event.dose);
      if (data == "Error")
        yield ErrorState(message: "Connection time out. ");
      else if (data == "Invalid") {
        yield ErrorState(message: "Invalid Credintials.");
      } else {
        yield ErrorState(message: "Land Added Successfully.");
      }
    }
    // else if (event is ViewFungicidesEvent) {
    //   yield DiseasesLoadingState();
    //   try {
    //     yield ViewFungicidesSuccess(treatments: event.);
    //   } catch (e) {
    //     yield ErrorState(message: e.toString());
    //   }
    // }
  }
}
