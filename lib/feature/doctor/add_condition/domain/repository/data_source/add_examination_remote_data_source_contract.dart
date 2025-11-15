import 'package:dartz/dartz.dart';
import 'package:smart_check/core/utils/failure.dart';
import 'package:smart_check/feature/doctor/add_condition/domain/entity/add_examination_request_entity.dart';

abstract class AddExaminationRemoteDataSourceContract {
  Future<Either<Failures, String>> addExamination({
    required AddExaminationRequestEntity examinationRequest,
  });
}
