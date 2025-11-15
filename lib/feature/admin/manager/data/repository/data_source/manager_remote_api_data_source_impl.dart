import 'package:dartz/dartz.dart';
import 'package:smart_check/core/utils/failure.dart';
import 'package:smart_check/feature/admin/manager/data/manager/manager_api_manager.dart';
import 'package:smart_check/feature/admin/manager/domain/repository/data_source/manager_remote_data_source_contract.dart';

class ManagerRemoteApiDataSourceImpl extends ManagerRemoteDataSourceContract {
  final ManagerApiManager managerApiManager;

  ManagerRemoteApiDataSourceImpl({required this.managerApiManager});
  @override
  Future<Either<Failures, String>> addEmployee({
    required String userName,
    required String password,
    required String branchName,
  }) {
    return managerApiManager.addEmployee(
      userName: userName,
      branchName: branchName,
      password: password,
    );
  }
}
