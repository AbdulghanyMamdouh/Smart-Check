import 'package:dartz/dartz.dart';
import 'package:smart_check/core/utils/failure.dart';
import 'package:smart_check/feature/auth/data/manager/login_api_manager.dart';
import 'package:smart_check/feature/auth/domain/entity/login_result_entity.dart';
import 'package:smart_check/feature/auth/domain/repository/data_source/auth_remote_data_source_contract.dart';

class AuthRemoteApiDataSourceImpl extends AuthRemoteDataSourceContract {
  final LoginApiManager loginApiManager;

  AuthRemoteApiDataSourceImpl({required this.loginApiManager});
  @override
  Future<Either<Failures, LoginResultEntity>> adminLogin({
    required String userName,
    required String password,
  }) async {
    final either = await loginApiManager.adminLogin(
      userName: userName,
      password: password,
    );
    return either.fold(
      (failure) => Left(failure),
      (loginResponse) => Right(
        loginResponse.toLoginResultEntity(),
      ),
    );
  }

  @override
  Future<Either<Failures, LoginResultEntity>> employeeLogin({
    required String userName,
    required String password,
  }) async {
    final either = await loginApiManager.employeeLogin(
      userName: userName,
      password: password,
    );
    return either.fold(
      (failure) => Left(failure),
      (loginResponse) => Right(
        loginResponse.toLoginResultEntity(),
      ),
    );
  }
}
