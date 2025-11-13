import 'package:dartz/dartz.dart';
import 'package:smart_check/core/utils/failure.dart';
import 'package:smart_check/feature/auth/domain/entity/login_result_entity.dart';
import 'package:smart_check/feature/auth/domain/repository/data_source/auth_remote_data_source_contract.dart';
import 'package:smart_check/feature/auth/domain/repository/repo/auth_login_repository_contract.dart';

class AuthRemoteRepositoryImpl extends AuthRepositoryContract {
  final AuthRemoteDataSourceContract authRemoteDataSourceContract;

  AuthRemoteRepositoryImpl({required this.authRemoteDataSourceContract});
  @override
  Future<Either<Failures, LoginResultEntity>> adminLogin({
    required String userName,
    required String password,
  }) {
    return authRemoteDataSourceContract.adminLogin(
      userName: userName,
      password: password,
    );
  }

  @override
  Future<Either<Failures, LoginResultEntity>> employeeLogin({
    required String userName,
    required String password,
  }) {
    return authRemoteDataSourceContract.employeeLogin(
      userName: userName,
      password: password,
    );
  }
}
