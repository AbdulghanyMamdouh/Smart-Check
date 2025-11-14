import 'package:dartz/dartz.dart';
import 'package:smart_check/core/utils/failure.dart';
import 'package:smart_check/feature/admin/home/domain/entity/examination_entity.dart';
import 'package:smart_check/feature/admin/home/domain/repository/data_source/home_data_sourec_contract.dart';
import 'package:smart_check/feature/admin/home/domain/repository/repo/home_repository_contract.dart';

class HomeRemoteRepositoryImpl extends HomeRepositoryContract {
  final HomeDataSourecContract homeDataSourecContract;

  HomeRemoteRepositoryImpl({required this.homeDataSourecContract});
  @override
  Future<Either<Failures, List<ExaminationEntity>>> getAllExaminations({
    required String branchName,
    required DateTime dateTime,
  }) {
    return homeDataSourecContract.getAllExaminations(
      branchName: branchName,
      dateTime: dateTime,
    );
  }

  @override
  Future<Either<Failures, List<ExaminationEntity>>> getExaminationsByClientId({
    required String clientCode,
  }) {
    return homeDataSourecContract.getExaminationsByClientId(
      clientCode: clientCode,
    );
  }

  @override
  Future<Either<Failures, List<ExaminationEntity>>> getExaminationsByDate({
    required DateTime dateTime,
  }) {
    return homeDataSourecContract.getExaminationsByDate(dateTime: dateTime);
  }
}
