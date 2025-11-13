import 'package:smart_check/feature/auth/domain/entity/user_entity.dart';

class LoginResultEntity {
  UserEntity? user;
  String? token;
  LoginResultEntity({this.user, this.token});
}
