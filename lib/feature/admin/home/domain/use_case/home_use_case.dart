import 'package:dartz/dartz.dart';
import 'package:smart_check/core/utils/failure.dart';
import 'package:smart_check/feature/admin/home/domain/entity/examination_entity.dart';
import 'package:smart_check/feature/admin/home/domain/repository/repo/home_repository_contract.dart';

class HomeUseCase {
  final HomeRepositoryContract homeRepositoryContract;

  HomeUseCase({required this.homeRepositoryContract});
  Future<Either<Failures, List<ExaminationEntity>>> getAllExaminations({
    required String branchName,
    required DateTime dateTime,
  }) {
    return homeRepositoryContract.getAllExaminations(
      branchName: branchName,
      dateTime: dateTime,
    );
  }
}
