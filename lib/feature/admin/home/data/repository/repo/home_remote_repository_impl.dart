import 'package:dartz/dartz.dart';
import 'package:smart_check/core/utils/failure.dart';
import 'package:smart_check/core/entity/examination_entity.dart';
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
}
