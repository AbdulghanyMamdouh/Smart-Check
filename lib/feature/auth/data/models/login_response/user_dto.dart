import 'package:smart_check/feature/auth/domain/entity/user_entity.dart';

class UserDTO extends UserEntity {
  UserDTO({super.username, super.id});

  factory UserDTO.fromJson(Map<String, dynamic> json) => UserDTO(
    username: json['username'] as String?,
    id: json['Id'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'username': username,
    'Id': id,
  };
}
