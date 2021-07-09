import 'package:bloc/bloc.dart';
import 'package:fungicide_utilizer_app/repository/authentication_repo.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationRepos repo;
  AuthenticationBloc(AuthenticationState initialState, this.repo)
      : super(initialState);
  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    // var pref = await SharedPreferences.getInstance();
    if (event is StartEvent) {
      yield LoginInitState();
    } else if (event is LoginButttonPressed) {
      yield LoginLoadingState();
      var data = await repo.login(event.mobile, event.password);
      //print("xxx $data");
      if (data == "Error")
        yield ConnectionErrorState(message: "Connection time out. ");
      else if (data == "Invalid") {
        yield LoginErrorState(message: "Invalid Credintials.");
      } else /*if (data == "8")*/ {
        yield FarmerLoginSuccessState();
        // } else {
        //   print("mafeesh data api msht3'lsh $data");
      }

      //   if (data != "Failed") {
      //     //pref.setString("token", data["token"]);
      //     yield FarmerLoginSuccessState();
      //   } else {
      //     yield LoginErrorState(message: "Invalid Credintials.");
      //   }
      // }
    }
  }
// class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
//   final AuthenticationService _authenticationService;

//   AuthenticationBloc(AuthenticationService authenticationService)
//       : assert(authenticationService != null),
//         _authenticationService = authenticationService,
//         super(AuthenticationInitial());

//   @override
//   Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
//     if (event is AppLoaded) {
//       yield* _mapAppLoadedToState(event);
//     }

//     if (event is UserLoggedIn) {
//       yield* _mapUserLoggedInToState(event);
//     }

//     if (event is UserLoggedOut) {
//       yield* _mapUserLoggedOutToState(event);
//     }
//   }

//   Stream<AuthenticationState> _mapAppLoadedToState(AppLoaded event) async* {
//     yield AuthenticationLoading();
//     try {
//       await Future.delayed(Duration(milliseconds: 500)); // a simulated delay
//       final currentUser = await _authenticationService.getCurrentUser();

//       if (currentUser != null) {
//         yield AuthenticationAuthenticated(user: currentUser);
//       } else {
//         yield AuthenticationNotAuthenticated();
//       }
//     } catch (e) {
//       yield AuthenticationFailure(message: e.message ?? 'An unknown error occurred');
//     }
//   }

//   Stream<AuthenticationState> _mapUserLoggedInToState(UserLoggedIn event) async* {
//     yield AuthenticationAuthenticated(user: event.user);
//   }

//   Stream<AuthenticationState> _mapUserLoggedOutToState(UserLoggedOut event) async* {
//     await _authenticationService.signOut();
//     yield AuthenticationNotAuthenticated();
//   }

}
