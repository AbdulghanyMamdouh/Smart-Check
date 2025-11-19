import 'package:dartz/dartz.dart';
import 'package:smart_check/core/entity/examination_entity.dart';
import 'package:smart_check/core/utils/failure.dart';
import 'package:smart_check/feature/search/domain/repository/data_source/search_remote_data_source_contract.dart';
import 'package:smart_check/feature/search/domain/repository/repo/search_repository_contract.dart';

class SearchRepositoryImpl extends SearchRepositoryContract {
  final SearchRemoteDataSourceContract searchRemoteDataSourceContract;

  SearchRepositoryImpl({required this.searchRemoteDataSourceContract});
  @override
  Future<Either<Failures, List<ExaminationEntity>>> getExaminationsByClientId({
    required String clientCode,
  }) {
    return searchRemoteDataSourceContract.getExaminationsByClientId(
      clientCode: clientCode,
    );
  }

  @override
  Future<Either<Failures, List<ExaminationEntity>>> getExaminationsByDate({
    required DateTime dateTime,
  }) {
    return searchRemoteDataSourceContract.getExaminationsByDate(
      dateTime: dateTime,
    );
  }
}
