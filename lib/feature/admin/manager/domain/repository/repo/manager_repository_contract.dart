import 'package:dartz/dartz.dart';
import 'package:smart_check/core/utils/failure.dart';
import 'package:smart_check/feature/admin/manager/domain/entity/employee_entity.dart';

abstract class ManagerRepositoryContract {
  Future<Either<Failures, String>> addEmployee({
    required String userName,
    required String password,
    required String branchName,
  });

  Future<Either<Failures, List<EmployeeEntity>>> getAllEmployees();
}
