import 'package:dartz/dartz.dart';
import 'package:smart_check/core/utils/failure.dart';
import 'package:smart_check/feature/doctor/add_condition/domain/entity/add_examination_request_entity.dart';
import 'package:smart_check/feature/doctor/add_condition/domain/repository/repo/add_examination_repository_contract.dart';

class AddExaminationUseCase {
  final AddExaminationRepositoryContract addExaminationRepositoryContract;

  AddExaminationUseCase({required this.addExaminationRepositoryContract});
  Future<Either<Failures, String>> addExamination({
    required AddExaminationRequestEntity examinationRequest,
  }) {
    return addExaminationRepositoryContract.addExamination(
      examinationRequest: examinationRequest,
    );
  }
}
