import 'package:dartz/dartz.dart';
import 'package:smart_check/core/utils/failure.dart';
import 'package:smart_check/feature/admin/manager/domain/repository/repo/manager_repository_contract.dart';

class AddEmployeeUseCase {
  final ManagerRepositoryContract managerRepositoryContract;

  AddEmployeeUseCase({required this.managerRepositoryContract});

  Future<Either<Failures, String>> addEmployee({
    required String userName,
    required String password,
    required String branchName,
  }) {
    return managerRepositoryContract.addEmployee(
      userName: userName,
      password: password,
      branchName: branchName,
    );
  }
}
