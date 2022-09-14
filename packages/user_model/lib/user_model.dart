library user_model;

import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel{
  const factory UserModel({
    required int id,
    required String name,
}) = _UserModel;
}
