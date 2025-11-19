import 'package:dartz/dartz.dart';
import 'package:smart_check/core/entity/examination_entity.dart';
import 'package:smart_check/core/utils/failure.dart';

abstract class SearchRemoteDataSourceContract {
  Future<Either<Failures, List<ExaminationEntity>>> getExaminationsByDate({
    required DateTime dateTime,
  });

  Future<Either<Failures, List<ExaminationEntity>>> getExaminationsByClientId({
    required String clientCode,
  });
}
