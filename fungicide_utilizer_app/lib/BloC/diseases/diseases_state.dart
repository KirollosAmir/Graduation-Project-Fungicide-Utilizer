import 'package:equatable/equatable.dart';
import 'package:fungicide_utilizer_app/DataLayer/disease.dart';
import 'package:fungicide_utilizer_app/DataLayer/fungicideInfo.dart';
import 'package:fungicide_utilizer_app/DataLayer/treatment.dart';

class DiseasesStates extends Equatable {
  @override
  List<Object> get props => [];
}

class DiseasesInitialState extends DiseasesStates {}

class DiseasesLoadingState extends DiseasesStates {}

class ViewDiseasesSuccess extends DiseasesStates {
  final List<Disease> diseases;
  ViewDiseasesSuccess({this.diseases});
}

class ViewDiseaseSuccess extends DiseasesStates {
  final Disease disease;
  ViewDiseaseSuccess({this.disease});
}

class ViewTreatmentsSuccess extends DiseasesStates {
  final List<Treatment> treatments;
  ViewTreatmentsSuccess({this.treatments});
}

class ViewTreatmentSuccess extends DiseasesStates {
  final Treatment treatment;
  ViewTreatmentSuccess({this.treatment});
}

class ErrorState extends DiseasesStates {
  final String message;
  ErrorState({this.message});
}

class AddingDiseaseState extends DiseasesStates {}

class AddDiseaseSuccessState extends DiseasesStates {
  final String message;
  AddDiseaseSuccessState({this.message});
}

class ViewFungicidesSuccess extends DiseasesStates {
  final List<Treatment> treatments;
  ViewFungicidesSuccess({this.treatments});
}

class ViewNotFungicideSuccess extends DiseasesStates {
  final Disease disease;

  final List<FungicideInfo> fungicides;
  ViewNotFungicideSuccess({this.disease, this.fungicides});
}

class AddFungicideDiseaseSuccessState extends DiseasesStates {
  final String message;
  AddFungicideDiseaseSuccessState({this.message});
}
