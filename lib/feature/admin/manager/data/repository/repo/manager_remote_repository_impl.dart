import 'package:dartz/dartz.dart';
import 'package:smart_check/core/utils/failure.dart';
import 'package:smart_check/feature/admin/manager/domain/entity/employee_entity.dart';
import 'package:smart_check/feature/admin/manager/domain/repository/data_source/manager_remote_data_source_contract.dart';
import 'package:smart_check/feature/admin/manager/domain/repository/repo/manager_repository_contract.dart';

class ManagerRemoteRepositoryImpl extends ManagerRepositoryContract {
  final ManagerRemoteDataSourceContract managerRemoteDataSourceContract;

  ManagerRemoteRepositoryImpl({required this.managerRemoteDataSourceContract});
  @override
  Future<Either<Failures, String>> addEmployee({
    required String userName,
    required String password,
    required String branchName,
  }) {
    return managerRemoteDataSourceContract.addEmployee(
      userName: userName,
      password: password,
      branchName: branchName,
    );
  }

  @override
  Future<Either<Failures, List<EmployeeEntity>>> getAllEmployees() {
    return managerRemoteDataSourceContract.getAllEmployees();
  }
}
