import 'package:equatable/equatable.dart';
import 'package:fungicide_utilizer_app/DataLayer/disease.dart';
import 'package:fungicide_utilizer_app/DataLayer/treatment.dart';

class DiseasesEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class ViewDiseasesEvent extends DiseasesEvents {}

// class ViewDiseaseEvent extends DiseasesEvents {
//   final Disease Disease;
//   ViewDiseaseEvent({this.Disease});
// }
class ViewDiseaseEvent extends DiseasesEvents {
  final Disease disease;
  ViewDiseaseEvent(this.disease);
}

class ViewTreatmentsEvent extends DiseasesEvents {
  final Disease disease;
  ViewTreatmentsEvent(this.disease);
}

class ViewTreatmentEvent extends DiseasesEvents {
  final Treatment treatment;
  ViewTreatmentEvent(this.treatment);
}

class AddDiseasesButtonEvent extends DiseasesEvents {}

// ignore: must_be_immutable
class SaveDiseaseButttonPressed extends DiseasesEvents {
  String diseasename;
  String severity;
  String symptoms;

  SaveDiseaseButttonPressed({this.diseasename, this.severity, this.symptoms});
}

class ViewFungicidesEvent extends DiseasesEvents {}

class ViewNotFungicide extends DiseasesEvents {
  final Disease disease;

  ViewNotFungicide(this.disease);
}

// ignore: must_be_immutable
class AddFungicideDiseaseEvent extends DiseasesEvents {
  //final Disease disease;
  // String cropid;
  String dose;
  String diseaseid;
  String fungicideid;
  AddFungicideDiseaseEvent(this.diseaseid, this.fungicideid, this.dose);
}
