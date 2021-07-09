import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fungicide_utilizer_app/BloC/register/registerEvent.dart';
import 'package:fungicide_utilizer_app/BloC/register/registerState.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  //AuthenticationRepos repo;             //, this.repo
  RegisterBloc(RegisterState initialState) : super(initialState);
  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    // var pref = await SharedPreferences.getInstance();
    if (event is StartEvent) {
      yield RegisterInitState();
    } else if (event is RegisterButttonPressed) {
      yield RegisterLoadingState();
      // var data = await repo.login(event.mobile, event.password);
      // //print("xxx $data");
      // if (data == "Error")
      //   yield ConnectionErrorState(message: "Connection time out. ");
      // else if (data == "Invalid") {
      //   yield RegisterErrorState(message: "Invalid Credintials.");
      // } else /*if (data == "8")*/ {
      //   yield RegisterSuccessState();
      //   // } else {
      //   //   print("mafeesh data api msht3'lsh $data");
      // }

      // //   if (data != "Failed") {
      // //     //pref.setString("token", data["token"]);
      // //     yield FarmerLoginSuccessState();
      // //   } else {
      // //     yield LoginErrorState(message: "Invalid Credintials.");
      // //   }
      // // }
    }
  }
}
