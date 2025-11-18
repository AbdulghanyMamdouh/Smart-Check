import 'package:dartz/dartz.dart';
import 'package:smart_check/core/utils/failure.dart';
import 'package:smart_check/feature/doctor/home/domain/entity/complete_examination_request_entity.dart';
import 'package:smart_check/feature/doctor/home/domain/entity/examination_entity.dart';
import 'package:smart_check/feature/doctor/home/domain/repository/repo/manage_examination_repository_contract.dart';

class ManageExaminationUseCase {
  final ManageExaminationRepositoryContract manageExaminationRepositoryContract;

  ManageExaminationUseCase({required this.manageExaminationRepositoryContract});

  Future<Either<Failures, String>> completeExamination({
    required CompleteExaminationRequestEntity examinationRequest,
  }) {
    return manageExaminationRepositoryContract.completeExamination(
      examinationRequest: examinationRequest,
    );
  }

  Future<Either<Failures, String>> updateExamination({
    required int examinationId,
    required String key,
    required String value,
  }) {
    return manageExaminationRepositoryContract.updateExamination(
      examinationId: examinationId,
      key: key,
      value: value,
    );
  }

  Future<Either<Failures, List<ExaminationEntity>>> getAllExaminations({
    required String branchName,
    required DateTime dateTime,
  }) {
    return manageExaminationRepositoryContract.getAllExaminations(
      branchName: branchName,
      dateTime: dateTime,
    );
  }
}
