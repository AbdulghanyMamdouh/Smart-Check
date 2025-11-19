import 'package:dartz/dartz.dart';
import 'package:smart_check/core/entity/examination_entity.dart';
import 'package:smart_check/core/utils/failure.dart';
import 'package:smart_check/feature/doctor/home/data/manager/home_doctor_api_manager.dart';
import 'package:smart_check/feature/doctor/home/data/model/complete_examination_request_dto.dart';
import 'package:smart_check/feature/doctor/home/domain/entity/complete_examination_request_entity.dart';
import 'package:smart_check/feature/doctor/home/domain/repository/data_source/manage_examination_remote_data_source_contract.dart';

class ManageExaminationRemoteApiDataSourceImpl
    extends ManageExaminationRemoteDataSourceContract {
  final HomeDoctorApiManager homeApiManager;

  ManageExaminationRemoteApiDataSourceImpl({required this.homeApiManager});
  @override
  Future<Either<Failures, String>> completeExamination({
    required CompleteExaminationRequestEntity examinationRequest,
  }) {
    return homeApiManager.completeExamination(
      CompleteExaminationRequestDto.fromEntity(examinationRequest),
    );
  }

  @override
  Future<Either<Failures, String>> updateExamination({
    required CompleteExaminationRequestEntity examinationRequest,
  }) {
    return homeApiManager.updateExamination(
      examination: CompleteExaminationRequestDto.fromEntity(examinationRequest),
    );
  }

  @override
  Future<Either<Failures, List<ExaminationEntity>>> getAllExaminations({
    required String branchName,
    required DateTime dateTime,
  }) {
    return homeApiManager.getAllExaminations(
      branchName: branchName,
      dateTime: dateTime,
    );
  }
}
