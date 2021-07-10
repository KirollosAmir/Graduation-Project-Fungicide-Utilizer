import 'package:equatable/equatable.dart';
import '../../DataLayer/crop.dart';
import '../../DataLayer/disease.dart';
import '../../DataLayer/treatment.dart';

class CropsStates extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends CropsStates {}

class LoadingState extends CropsStates {}

class ViewCropsSuccess extends CropsStates {
  final List<Crop> crops;
  ViewCropsSuccess({this.crops});
}

class ViewCropSuccess extends CropsStates {
  final Crop crop;
  ViewCropSuccess({this.crop});
}

class ViewDiseasesSuccess extends CropsStates {
  final List<Disease> diseases;
  ViewDiseasesSuccess({this.diseases});
}

class ViewDiseaseSuccess extends CropsStates {
  final Disease disease;
  ViewDiseaseSuccess({this.disease});
}

class ViewTreatmentsSuccess extends CropsStates {
  final List<Treatment> treatments;
  ViewTreatmentsSuccess({this.treatments});
}

class ViewTreatmentSuccess extends CropsStates {
  final Treatment treatment;
  ViewTreatmentSuccess({this.treatment});
}

class ErrorState extends CropsStates {
  final String message;
  ErrorState({this.message});
}

class AddingCropState extends CropsStates {}

class AddCropSuccessState extends CropsStates {
  final String message;
  AddCropSuccessState({this.message});
}
