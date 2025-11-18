import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_check/core/constants/api_constatnt.dart';
import 'package:smart_check/core/di/di.dart';
import 'package:smart_check/core/utils/failure.dart';
import 'package:smart_check/feature/admin/home/data/model/examination.dart';
import 'package:smart_check/feature/admin/home/data/model/get_examination_response.dart';

class HomeApiManager {
  HomeApiManager._();
  static HomeApiManager? _instance;
  static HomeApiManager getInstance() {
    _instance ??= HomeApiManager._();
    return _instance!;
  }

  Future<Either<Failures, List<Examination>>> getAllExaminations({
    required String branchName,
    required DateTime dateTime,
  }) async {
    final connected = await isConnected();
    if (connected) {
      try {
        final response = await dio.get(ApiConstant.getAllExaminations);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          var getExaminationsResponse = GetExaminationResponse.fromJson(
            response.data!,
          );
          final allExaminations = getExaminationsResponse.examinations;
          final filteredExaminations = (allExaminations ?? []).where((
            examination,
          ) {
            final created = examination.createdAt;
            if (created == null) return false;

            final isSameDay =
                created.year == dateTime.year &&
                created.month == dateTime.month &&
                created.day == dateTime.day;

            return examination.branchName == branchName && isSameDay;
          }).toList();
          return Right(filteredExaminations);
        } else {
          return Left(
            ServerError(
              errorMessage: response.statusMessage ?? 'error from server',
            ),
          );
        }
      } on DioException catch (error) {
        return Left(
          ServerError(errorMessage: error.message ?? error.toString()),
        );
      }
    } else {
      return Left(
        NetworkError(errorMessage: 'check your internet connection.!'),
      );
    }
  }
}
