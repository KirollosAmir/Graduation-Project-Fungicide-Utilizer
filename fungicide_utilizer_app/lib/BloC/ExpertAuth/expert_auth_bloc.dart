import 'package:bloc/bloc.dart';
import 'package:fungicide_utilizer_app/repository/expertAuth_repo.dart';
import 'expert_auth_event.dart';
import 'expert_auth_state.dart';

class ExpertAuthenticationBloc
    extends Bloc<ExpertAuthenticationEvent, ExpertAuthenticationState> {
  ExpertAuthenticationRepos repo;
  ExpertAuthenticationBloc(ExpertAuthenticationState initialState, this.repo)
      : super(initialState);
  @override
  Stream<ExpertAuthenticationState> mapEventToState(
      ExpertAuthenticationEvent event) async* {
    // var pref = await SharedPreferences.getInstance();
    if (event is StartEvent) {
      yield ELoginInitState();
    } else if (event is LoginButttonPressed) {
      yield ELoginLoadingState();
      var data = await repo.login(event.mobile, event.password);
      if (data == "Error")
        yield ConnectionErrorState(message: "Connection time out. ");
      else if (data == "Invalid") {
        yield ELoginErrorState(message: "Invalid Credintials.");
      } else {
        yield ExpertLoginSuccessState();
      }
    }
  }
}
