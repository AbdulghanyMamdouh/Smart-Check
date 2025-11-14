import 'package:dartz/dartz.dart';
import 'package:smart_check/core/utils/failure.dart';
import 'package:smart_check/feature/admin/home/data/manager/home_api_manager.dart';
import 'package:smart_check/feature/admin/home/domain/entity/examination_entity.dart';
import 'package:smart_check/feature/admin/home/domain/repository/data_source/home_data_sourec_contract.dart';

class HomeRemoteApiDataSourceImpl extends HomeDataSourecContract {
  final HomeApiManager homeApiManager;

  HomeRemoteApiDataSourceImpl({required this.homeApiManager});
  @override
  Future<Either<Failures, List<ExaminationEntity>>> getAllExaminations({
    required String branchName,
    required DateTime dateTime,
  }) {
    return homeApiManager.getAllExaminations(
      branchName: branchName,
      dateTime: dateTime,
    );
  }

  @override
  Future<Either<Failures, List<ExaminationEntity>>> getExaminationsByClientId({
    required String clientCode,
  }) {
    return homeApiManager.getExaminationsByClientCode(clientCode: clientCode);
  }

  @override
  Future<Either<Failures, List<ExaminationEntity>>> getExaminationsByDate({
    required DateTime dateTime,
  }) {
    return homeApiManager.getExaminationsByDate(date: dateTime);
  }
}
