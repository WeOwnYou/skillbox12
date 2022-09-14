import 'dart:async';
import 'package:data/data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_model/user_model.dart';
part 'main_bloc.freezed.dart';

class MainBloc {
  final AuthService authService;
  final StreamController<MainBlocEvent> _eventsController = StreamController();
  final StreamController<MainBlocState> _stateController = StreamController();

  Stream<MainBlocState> get stream => _stateController.stream;

  MainBloc({required this.authService}) {
    _eventsController.stream.listen((event) {
      event.map<void>(
        init: (_) async {
          _stateController.add(const MainBlocState.loading());
          await Future<void>.delayed(const Duration(seconds: 1));
          _stateController.add(
            MainBlocState.loaded(
              userModel: await authService.getDefaultUser(),
            ),
          );
        },
        setUser: (setUserEvent) async {
          _stateController.add(
            MainBlocState.loaded(
              userModel: await authService.getUserById(setUserEvent.userId),
            ),
          );
        },
      );
    });
  }

  Future<void> add(MainBlocEvent event) async {
    if (_eventsController.isClosed) return;
    _eventsController.add(event);
  }

  void dispose() {
    _eventsController.close();
    _stateController.close();
  }
}

@freezed
class MainBlocState with _$MainBlocState {
  const factory MainBlocState.loading() = MainLoadingState;
  const factory MainBlocState.loaded({required UserModel userModel}) =
      MainLoadedState;
}

@freezed
class MainBlocEvent with _$MainBlocEvent {
  const factory MainBlocEvent.init() = _MainInitEvent;
  const factory MainBlocEvent.setUser({required int userId}) = _MainSetEvent;
}
