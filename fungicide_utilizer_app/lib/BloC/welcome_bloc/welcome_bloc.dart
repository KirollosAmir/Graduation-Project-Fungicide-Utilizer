import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fungicide_utilizer_app/BloC/welcome_bloc/welcome_events.dart';
import 'package:fungicide_utilizer_app/BloC/welcome_bloc/welcome_states.dart';
import 'package:fungicide_utilizer_app/repository/welcome_repo.dart';



class WelcomeBloc extends Bloc<WelcomeEvents, WelcomeStates> {
  WelcomeRepository repo;
  WelcomeBloc(WelcomeStates initialState, this.repo) : super(initialState);

  @override
  Stream<WelcomeStates> mapEventToState(WelcomeEvents event) async* {
    if (event is FarmerLoginEvent) {
      yield LoadingState();
      try {
        yield FarmerLoginSuccess();
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    } else if (event is FarmerRegisterEvent) {
      yield LoadingState();
      try {
        yield FarmerRegisterSuccess();
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    } else if (event is ExpertLoginEvent) {
      yield LoadingState();
      try {
        yield ExpertLoginSuccess();
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    } else if (event is FarmerLoginActionEvent) {
      yield LoadingState();
      try {
        var result = await repo.farmerLogin(event.mobile, event.password);
        yield FarmerLoginActionSuccess(result: result);
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    } else if (event is FarmerRegisterActionEvent) {
      yield LoadingState();
      try {
        var result =
            await repo.farmerRegister(event.name, event.mobile, event.password);
        yield FarmerRegisterActionSuccess(result: result);
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    } else if (event is ExpertLoginActionEvent) {
      yield LoadingState();
      try {
        var result = await repo.expertLogin(event.mobile, event.password);
        yield ExpertLoginActionSuccess(result: result);
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    }
  }
}
