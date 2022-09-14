library data;

import 'package:user_model/user_model.dart';

abstract class AuthService{
  bool authorizationStatus();
  Future<UserModel> getDefaultUser();
  Future<UserModel> getUserById(int id);
}
