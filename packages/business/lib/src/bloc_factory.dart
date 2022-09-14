import 'package:business/src/main_bloc.dart';
import 'package:data/data.dart';
import 'package:get_it/get_it.dart';

class BlocFactory {
  BlocFactory._();
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  static final instance = BlocFactory._();

  void initialize() {
    ServiceProvider.instance.initialize();
    _getIt.registerFactory<MainBloc>(
      () => MainBloc(
        authService: ServiceProvider.instance.get<AuthService>(),
      ),
    );
  }
}
