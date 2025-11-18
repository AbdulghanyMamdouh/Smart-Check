import 'package:dartz/dartz.dart';
import 'package:smart_check/core/utils/failure.dart';
import 'package:smart_check/feature/search/data/manager/search_api_manager.dart';
import 'package:smart_check/feature/search/domain/entity/examination_entity.dart';
import 'package:smart_check/feature/search/domain/repository/data_source/search_remote_data_source_contract.dart';

class SearchRemoteApiDataSourceImpl extends SearchRemoteDataSourceContract {
  final SearchApiManager searchApiManager;

  SearchRemoteApiDataSourceImpl({required this.searchApiManager});
  @override
  Future<Either<Failures, List<ExaminationEntity>>> getExaminationsByClientId({
    required String clientCode,
  }) {
    return searchApiManager.getExaminationsByClientCode(clientCode: clientCode);
  }

  @override
  Future<Either<Failures, List<ExaminationEntity>>> getExaminationsByDate({
    required DateTime dateTime,
  }) {
    return searchApiManager.getExaminationsByDate(date: dateTime);
  }
}
