import 'package:dartz/dartz.dart';
import 'package:smart_check/core/utils/failure.dart';
import 'package:smart_check/feature/doctor/add_condition/data/manager/add_examination_api_manager.dart';
import 'package:smart_check/feature/doctor/add_condition/data/models/add_examination_request_dto.dart';
import 'package:smart_check/feature/doctor/add_condition/domain/entity/add_examination_request_entity.dart';
import 'package:smart_check/feature/doctor/add_condition/domain/repository/data_source/add_examination_remote_data_source_contract.dart';

class AddConditionRemoteApiDataSourceImpl
    extends AddExaminationRemoteDataSourceContract {
  final AddExaminationApiManager addExaminationApiManager;

  AddConditionRemoteApiDataSourceImpl({
    required this.addExaminationApiManager,
  });
  @override
  Future<Either<Failures, String>> addExamination({
    required AddExaminationRequestEntity examinationRequest,
  }) {
    return addExaminationApiManager.addExamination(
      AddExaminationRequestDto.fromEntity(examinationRequest),
    );
  }
}
