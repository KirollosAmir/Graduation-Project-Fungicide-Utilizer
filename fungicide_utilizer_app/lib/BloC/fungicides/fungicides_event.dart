import 'package:equatable/equatable.dart';
import '../../DataLayer/treatment.dart';

class FungicidesEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class ViewFungicidesEvent extends FungicidesEvents {}

class ViewFungicideEvent extends FungicidesEvents {
  final Treatment treatment;
  ViewFungicideEvent(this.treatment);
}

class AddFungicidesButtonEvent extends FungicidesEvents {}

// ignore: must_be_immutable
class SaveFungicidesButttonPressed extends FungicidesEvents {
  String name;
  String disc;

  SaveFungicidesButttonPressed({this.name, this.disc});
}
