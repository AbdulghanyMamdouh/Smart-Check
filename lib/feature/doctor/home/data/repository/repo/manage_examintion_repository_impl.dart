import 'package:dartz/dartz.dart';
import 'package:smart_check/core/utils/failure.dart';
import 'package:smart_check/feature/doctor/home/domain/entity/complete_examination_request_entity.dart';
import 'package:smart_check/feature/doctor/home/domain/repository/data_source/manage_examination_remote_data_source_contract.dart';
import 'package:smart_check/feature/doctor/home/domain/repository/repo/manage_examination_repository_contract.dart';

class ManageExamintionRepositoryImpl
    extends ManageExaminationRepositoryContract {
  final ManageExaminationRemoteDataSourceContract
  manageExaminationRemoteDataSourceContract;

  ManageExamintionRepositoryImpl({
    required this.manageExaminationRemoteDataSourceContract,
  });
  @override
  Future<Either<Failures, String>> completeExamination({
    required CompleteExaminationRequestEntity examinationRequest,
  }) {
    return manageExaminationRemoteDataSourceContract.completeExamination(
      examinationRequest: examinationRequest,
    );
  }

  @override
  Future<Either<Failures, String>> updateExamination({
    required int examinationId,
    required String key,
    required String value,
  }) {
    return manageExaminationRemoteDataSourceContract.updateExamination(
      examinationId: examinationId,
      key: key,
      value: value,
    );
  }
}
