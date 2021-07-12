import 'package:equatable/equatable.dart';
import '../../DataLayer/crop.dart';
import '../../DataLayer/disease.dart';
import '../../DataLayer/treatment.dart';

class CropsEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class ViewCropsEvent extends CropsEvents {}

// class ViewCropEvent extends CropsEvents {
//   final Crop crop;
//   ViewCropEvent({this.crop});
// }
class ViewCropEvent extends CropsEvents {
  final Crop crop;
  ViewCropEvent(this.crop);
}

class ViewDiseasesEvent extends CropsEvents {
  final Crop cropp;
  ViewDiseasesEvent(this.cropp);
}

class ViewDiseaseEvent extends CropsEvents {
  final Disease disease;
  ViewDiseaseEvent(this.disease);
}

class ViewTreatmentsEvent extends CropsEvents {
  final Disease disease;
  ViewTreatmentsEvent(this.disease);
}

class ViewTreatmentEvent extends CropsEvents {
  final Treatment treatment;
  ViewTreatmentEvent(this.treatment);
}

class AddCropsButtonEvent extends CropsEvents {}

// ignore: must_be_immutable
class SaveCropButttonPressed extends CropsEvents {
  String cropname;
  String duration;

  SaveCropButttonPressed({this.cropname, this.duration});
}

class ViewNotCropDisease extends CropsEvents {
  final Crop crop;

  ViewNotCropDisease(this.crop);
}

// ignore: must_be_immutable
class AddCropDiseaseEvent extends CropsEvents {
  //final Disease disease;
  // String cropid;
  String cropid;
  String diseaseid;
  AddCropDiseaseEvent(this.diseaseid, this.cropid);
}
