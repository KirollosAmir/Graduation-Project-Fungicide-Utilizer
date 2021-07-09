// import 'package:bloc/bloc.dart';
// import 'package:fungicide_utilizer_app/BloC/authentication/authentication_bloc.dart';
// import 'package:fungicide_utilizer_app/BloC/authentication/authentication_event.dart';
// import 'login_event.dart';
// import 'login_state.dart';

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   final AuthenticationBloc _authenticationBloc;
//   final AuthenticationService _authenticationService;

//   LoginBloc(AuthenticationBloc authenticationBloc, AuthenticationService authenticationService)
//       : assert(authenticationBloc != null),
//         assert(authenticationService != null),
//         _authenticationBloc = authenticationBloc,
//         _authenticationService = authenticationService,
//         super(LoginInitial());

//   @override
//   Stream<LoginState> mapEventToState(LoginEvent event) async* {
//     if (event is LoginInWithEmailButtonPressed) {
//       yield* _mapLoginWithEmailToState(event);
//     }
//   }

//   Stream<LoginState> _mapLoginWithEmailToState(LoginInWithEmailButtonPressed event) async* {
//     yield LoginLoading();
//     try {
//       final user = await _authenticationService.signInWithEmailAndPassword(event.email, event.password);
//       if (user != null) {
//         _authenticationBloc.add(UserLoggedIn(user: user));
//         yield LoginSuccess();
//         yield LoginInitial();
//       } else {
//         yield LoginFailure(error: 'Something very weird just happened');
//       }
//     } on AuthenticationException catch (e) {
//       yield LoginFailure(error: e.message);
//     } catch (err) {
//       yield LoginFailure(error: err.message ?? 'An unknown error occured');
//     }
//   }
// }
