import 'package:dartz/dartz.dart';
import 'package:smart_check/core/utils/failure.dart';
import 'package:smart_check/feature/auth/domain/entity/login_result_entity.dart';
import 'package:smart_check/feature/auth/domain/repository/repo/auth_login_repository_contract.dart';

class LoginUseCase {
  final AuthRepositoryContract authRepositoryContract;

  LoginUseCase({required this.authRepositoryContract});
  Future<Either<Failures, LoginResultEntity>> adminLogin({
    required String userName,
    required String password,
  }) {
    return authRepositoryContract.adminLogin(
      userName: userName,
      password: password,
    );
  }

  Future<Either<Failures, LoginResultEntity>> employeeLogin({
    required String userName,
    required String password,
  }) {
    return authRepositoryContract.employeeLogin(
      userName: userName,
      password: password,
    );
  }
}
