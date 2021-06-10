import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fungicide_utilizer/BloC/land/landEvent.dart';
import 'package:fungicide_utilizer/BloC/land/landState.dart';
import 'package:fungicide_utilizer/repository/mylands_repo.dart';

class LandBloc extends Bloc<LandEvent, LandState> {
  MyLandsRepos repo;
  LandBloc(LandState initialState, this.repo) : super(initialState);

  @override
  Stream<LandState> mapEventToState(LandEvent event) async* {
    if (event is ViewLandsEvent) {
      yield LoadingState();
      try {
        var lands = await repo.fetchLands();
        yield SuccessState(lands: lands);
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    }
  }
}
