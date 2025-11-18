import 'package:dartz/dartz.dart';
import 'package:smart_check/core/utils/failure.dart';
import 'package:smart_check/feature/search/domain/entity/examination_entity.dart';
import 'package:smart_check/feature/search/domain/repository/repo/search_repository_contract.dart';

class SearchUseCase {
  final SearchRepositoryContract searchRepositoryContract;

  SearchUseCase({required this.searchRepositoryContract});
  Future<Either<Failures, List<ExaminationEntity>>> getExaminationsByDate({
    required DateTime dateTime,
  }) {
    return searchRepositoryContract.getExaminationsByDate(dateTime: dateTime);
  }

  Future<Either<Failures, List<ExaminationEntity>>> getExaminationsByClientId({
    required String clientCode,
  }) {
    return searchRepositoryContract.getExaminationsByClientId(
      clientCode: clientCode,
    );
  }
}
