library data;

import 'package:data/src/service.dart';
import 'package:user_model/user_model.dart';

class DummyService implements AuthService{
  @override
  bool authorizationStatus() {
    return true;
  }

  @override
  Future<UserModel> getDefaultUser() async{
    await Future<void>.delayed(const Duration(seconds: 1));
    return const UserModel(id: 0, name: 'Default');
  }

  @override
  Future<UserModel> getUserById(int id) async{
    await Future<void>.delayed(const Duration(seconds: 1));
    return UserModel(id: id, name: 'Not Default user $id');
  }
}
