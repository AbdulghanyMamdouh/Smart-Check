import 'package:dartz/dartz.dart';
import 'package:smart_check/core/utils/failure.dart';
import 'package:smart_check/feature/admin/home/domain/entity/examination_entity.dart';

abstract class HomeRepositoryContract {
  Future<Either<Failures, List<ExaminationEntity>>> getAllExaminations({
    required String branchName,
    required DateTime dateTime,
  });
  Future<Either<Failures, List<ExaminationEntity>>> getExaminationsByDate({
    required DateTime dateTime,
  });

  Future<Either<Failures, List<ExaminationEntity>>> getExaminationsByClientId({
    required String clientCode,
  });
}
