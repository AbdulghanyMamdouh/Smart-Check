import 'package:dartz/dartz.dart';
import 'package:smart_check/core/utils/failure.dart';
import 'package:smart_check/core/entity/examination_entity.dart';

abstract class HomeDataSourecContract {
  Future<Either<Failures, List<ExaminationEntity>>> getAllExaminations({
    required String branchName,
    required DateTime dateTime,
  });
}
