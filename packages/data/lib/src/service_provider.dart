import 'package:data/src/internal.dart';
import 'package:data/src/service.dart';
import 'package:get_it/get_it.dart';

class ServiceProvider{
  int a = 1;
  // ServiceProvider._();
  // ServiceProvider._(this.a);

  final _getIt = GetIt.I; //static?

  T get <T extends Object> () => _getIt.get<T>();

  static final instance = ServiceProvider();//ServiceProvider._();

  void initialize(){
    a = 2;
    _getIt.registerLazySingleton<AuthService>(DummyService.new);
  }
}
