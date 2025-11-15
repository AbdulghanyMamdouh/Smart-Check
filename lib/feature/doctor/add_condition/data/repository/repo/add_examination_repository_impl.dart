import 'package:dartz/dartz.dart';
import 'package:smart_check/core/utils/failure.dart';
import 'package:smart_check/feature/doctor/add_condition/domain/entity/add_examination_request_entity.dart';
import 'package:smart_check/feature/doctor/add_condition/domain/repository/data_source/add_examination_remote_data_source_contract.dart';
import 'package:smart_check/feature/doctor/add_condition/domain/repository/repo/add_examination_repository_contract.dart';

class AddExaminationRepositoryImpl extends AddExaminationRepositoryContract {
  final AddExaminationRemoteDataSourceContract
  addExaminationRemoteDataSourceContract;

  AddExaminationRepositoryImpl({
    required this.addExaminationRemoteDataSourceContract,
  });
  @override
  Future<Either<Failures, String>> addExamination({
    required AddExaminationRequestEntity examinationRequest,
  }) {
    return addExaminationRemoteDataSourceContract.addExamination(
      examinationRequest: examinationRequest,
    );
  }
}
