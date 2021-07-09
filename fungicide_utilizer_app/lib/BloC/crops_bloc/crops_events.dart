import 'package:equatable/equatable.dart';
import '../../DataLayer/crop.dart';
import '../../DataLayer/disease.dart';
import '../../DataLayer/treatment.dart';

class CropsEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class ViewCropsEvent extends CropsEvents {}

class ViewCropEvent extends CropsEvents {
  final Crop crop;
  ViewCropEvent({this.crop});
}

class ViewDiseasesEvent extends CropsEvents {
  final Crop crop;
  ViewDiseasesEvent({this.crop});
}

class ViewDiseaseEvent extends CropsEvents {
  final Disease disease;
  ViewDiseaseEvent({this.disease});
}

class ViewTreatmentsEvent extends CropsEvents {
  final Disease disease;
  ViewTreatmentsEvent({this.disease});
}

class ViewTreatmentEvent extends CropsEvents {
  final Treatment treatment;
  ViewTreatmentEvent({this.treatment});
}
