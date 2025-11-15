import 'package:dartz/dartz.dart';
import 'package:smart_check/core/utils/failure.dart';

abstract class ManagerRepositoryContract {
  Future<Either<Failures, String>> addEmployee({
    required String userName,
    required String password,
    required String branchName,
  });
}
