import 'package:dartz/dartz.dart';
import 'package:smart_check/core/utils/failure.dart';
import 'package:smart_check/feature/doctor/home/domain/entity/complete_examination_request_entity.dart';

abstract class ManageExaminationRepositoryContract {
  Future<Either<Failures, String>> completeExamination({
    required CompleteExaminationRequestEntity examinationRequest,
  });
  Future<Either<Failures, String>> updateExamination({
    required int examinationId,
    required String key,
    required String value,
  });
}
