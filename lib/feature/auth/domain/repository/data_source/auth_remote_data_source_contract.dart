import 'package:dartz/dartz.dart';
import 'package:smart_check/core/utils/failure.dart';
import 'package:smart_check/feature/auth/domain/entity/login_result_entity.dart';

abstract class AuthRemoteDataSourceContract {
  Future<Either<Failures, LoginResultEntity>> adminLogin({
    required String userName,
    required String password,
  });
  Future<Either<Failures, LoginResultEntity>> employeeLogin({
    required String userName,
    required String password,
  });
}
