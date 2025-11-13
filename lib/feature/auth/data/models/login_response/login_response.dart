import 'package:smart_check/feature/auth/domain/entity/login_result_entity.dart';
import 'user_dto.dart';

class LoginResponse {
  UserDTO? userInfo;
  bool? success;
  String? mess;
  String? token;

  LoginResponse({this.userInfo, this.success, this.mess, this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    userInfo: json['userInfo'] == null
        ? null
        : UserDTO.fromJson(json['userInfo'] as Map<String, dynamic>),
    success: json['success'] as bool?,
    mess: json['mess'] as String?,
    token: json['token'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'userInfo': userInfo?.toJson(),
    'success': success,
    'mess': mess,
    'token': token,
  };
  LoginResultEntity toLoginResultEntity() {
    return LoginResultEntity(
      user: userInfo,
      token: token,
    );
  }
}
